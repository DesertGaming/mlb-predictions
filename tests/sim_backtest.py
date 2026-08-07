# Sim-based joint backtest for optimal K and beta values

import os
from src.data_pipeline.strength_formulas import pythagenpat, stabilizing_coefficient, weighted_estimate
from src.db.connection import get_connection
import random
from datetime import timedelta
from collections import defaultdict, namedtuple
from bisect import bisect_right
from src.simulation.log5 import log5, apply_hfa, choose_winner
import time

random.seed(27)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
QUERY_PATH = os.path.join(BASE_DIR, "..", "sql", "queries", "backtest_data.sql")

with open(QUERY_PATH, "r") as f:
    cumulative_query = f.read()

schedule_query = "SELECT game_date, home_team_id, away_team_id FROM schedule WHERE EXTRACT(YEAR FROM game_date) IN (2019, 2021, 2022, 2023, 2024, 2025) AND game_status IN ('Final', 'Completed Early') ORDER BY game_date;"

with get_connection() as conn:
    with conn.cursor() as cur:
        cur.execute(cumulative_query)
        per_game_data = cur.fetchall()
        cur.execute(schedule_query)
        raw_schedule = cur.fetchall()
        cur.execute("SELECT team_id FROM teams;")
        all_team_ids = [row[0] for row in cur.fetchall()]
conn.close()

def get_snapshot_dates(season_start, season_end, anchors=(0.15, 0.30, 0.45, 0.60, 0.75, 0.90), jitter=0.03):
    season_length = (season_end - season_start).days
    snapshot_dates = []
    for anchor in anchors:
        jittered_pct = anchor + random.uniform(-jitter, jitter)
        jittered_pct = max(0.0, min(jittered_pct, 1.0))  # keep within season bounds
        offset_days = int(season_length * jittered_pct)
        snapshot_dates.append(season_start + timedelta(days=offset_days))
    return snapshot_dates

season_bounds = {}
raw_by_season = defaultdict(list)
ScheduleRow = namedtuple("ScheduleRow", ["game_date", "home_team_id", "away_team_id"])

for game_date, home_team_id, away_team_id in raw_schedule:
    season = game_date.year
    raw_by_season[season].append(ScheduleRow(game_date, home_team_id, away_team_id))

    if season not in season_bounds:
        season_bounds[season] = [game_date, game_date]
    else:
        if game_date < season_bounds[season][0]:
            season_bounds[season][0] = game_date
        if game_date > season_bounds[season][1]:
            season_bounds[season][1] = game_date
            
dates_list = []
for season, bounds in season_bounds.items():
    season_start, season_end = bounds
    dates_list.extend(get_snapshot_dates(season_start, season_end))

TeamGameRow = namedtuple("TeamGameRow", ["game_date", "games_played", "runs_scored", "runs_allowed", "wins_so_far", "preseason_strength", "final_wins"])

team_season_rows = defaultdict(list)

for row in per_game_data:
    season, team_id, runs_scored, runs_allowed, games_played, _games_remaining, wins_so_far, final_wins, preseason_strength, game_date = row
    runs_scored = float(runs_scored)
    runs_allowed = float(runs_allowed)
    games_played = float(games_played)
    wins_so_far = float(wins_so_far)
    final_wins = float(final_wins)
    preseason_strength = float(preseason_strength)
    team_season_rows[(team_id, season)].append(
        TeamGameRow(game_date, games_played, runs_scored, runs_allowed, wins_so_far, preseason_strength, final_wins)
    )

preseason = {}
total_wins = {}

for (team_id, season), rows in team_season_rows.items():
    first_row = rows[0]
    preseason[(team_id, season)] = first_row.preseason_strength
    total_wins[(team_id, season)] = first_row.final_wins

def get_row_as_of(rows, as_of_date):
    idx = bisect_right(rows, as_of_date, key=lambda r: r.game_date)
    if idx == 0:
        return None  # no games played yet as of this date
    return rows[idx - 1]

def get_rows_after(rows, as_of_date):
    idx = bisect_right(rows, as_of_date, key=lambda r: r.game_date)
    return rows[idx:]

candidate_ks = [10, 20]
candidate_betas = [0.025]

n_simulations = 1000

results = {}

sweep_start = time.time()

for k in candidate_ks:
    k_start = time.time()
    for beta in candidate_betas:
        squared_errors = []

        for as_of_date in dates_list:
            season = as_of_date.year

            # --- pulled once per snapshot date, reused for every game/iteration below ---
            team_rows_today = {}
            for team_id in all_team_ids:
                row = get_row_as_of(team_season_rows[(team_id, season)], as_of_date)
                team_rows_today[team_id] = row

            remaining_games = get_rows_after(raw_by_season[season], as_of_date)  # adjust to however schedule ends up structured

            team_strengths = {}
            wins_so_far_today = {}
            for team_id, row in team_rows_today.items():
                pythag = pythagenpat(row.games_played, row.runs_scored, row.runs_allowed)
                alpha = stabilizing_coefficient(row.games_played, k)
                team_strengths[team_id] = weighted_estimate(alpha, row.preseason_strength, pythag)
                wins_so_far_today[team_id] = row.wins_so_far
            # -----------------------------------------------------------------------------

            win_totals = defaultdict(list)

            for n in range(n_simulations):
                temp_wins = wins_so_far_today.copy()
                for game in remaining_games:
                    home_team_id, away_team_id = game.home_team_id, game.away_team_id
                    base_prob = log5(team_strengths[home_team_id], team_strengths[away_team_id])
                    final_prob = apply_hfa(base_prob, beta, 0.05, 0.95)
                    if choose_winner(final_prob):
                        temp_wins[home_team_id] += 1
                    else:
                        temp_wins[away_team_id] += 1
                for team_id, wins in temp_wins.items():
                    win_totals[team_id].append(wins)

            for team_id, totals in win_totals.items():
                predicted_mean = sum(totals) / len(totals)
                actual = total_wins[(team_id, season)]
                squared_errors.append((predicted_mean - actual) ** 2)

        mse = sum(squared_errors) / len(squared_errors)
        results[(k, beta)] = mse
        print(f"k={k}, beta={beta}: MSE={mse} (elapsed: {time.time() - sweep_start:.1f}s)")
    print(f"--- finished k={k} in {time.time() - k_start:.1f}s ---")

print(f"Total sweep time: {time.time() - sweep_start:.1f}s")