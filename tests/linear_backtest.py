# Initial Linear Calculation for Optimal K

import os
from src.data_pipeline.strength_formulas import pythagenpat, stabilizing_coefficient, weighted_estimate
from src.db.connection import get_connection

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
QUERY_PATH = os.path.join(BASE_DIR, "..", "sql", "queries", "backtest_data.sql")

with open(QUERY_PATH, "r") as f:
    cumulative_query = f.read()

with get_connection() as conn:
    with conn.cursor() as cur:
        cur.execute(cumulative_query)
        per_game_data = cur.fetchall()
conn.close()

mses = {}
for k in range(30, 141, 10):
    squared_errors = []
    for season, team_id, runs_scored, runs_allowed, games_played, games_remaining, wins_so_far, final_wins, preseason_strength, _game_date in per_game_data:
        games_played = float(games_played)
        runs_scored = float(runs_scored)
        runs_allowed = float(runs_allowed)
        preseason_strength = float(preseason_strength)
        games_remaining = float(games_remaining)
        wins_so_far = float(wins_so_far)
        final_wins = float(final_wins)

        if games_played in (24, 49, 73, 97, 121, 146):

            pythag = pythagenpat(games_played, runs_scored, runs_allowed)
            alpha = stabilizing_coefficient(games_played, k)
            weighted_strength = weighted_estimate(alpha, preseason_strength, pythag)

            predicted_final_wins = wins_so_far + (weighted_strength * games_remaining)
            squared_error = (predicted_final_wins - final_wins) ** 2
            squared_errors.append(squared_error)
    mse = sum(squared_errors) / len(squared_errors)
    mses[k] = mse

for k in mses:
    print(f"MSE for K = {k}: {mses[k]}")
