# Core funtion for calculating strength estimates

import os
from datetime import date
from src.data_pipeline.strength_formulas import pythagenpat, stabilizing_coefficient, weighted_estimate

def calculate_strengths(cur, as_of_date):
    """
    Calculates weighted expected strength of all 30 teams on the given date.
    """

    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    QUERY_PATH = os.path.join(BASE_DIR, "..", "..", "sql", "queries", "aggregate_team_runs.sql")

    with open(QUERY_PATH, "r") as f:
        aggregation_query = f.read()

    upsert_sql = """INSERT INTO daily_team_strength
                        (as_of_date, season, team_id, games_played, runs_scored, runs_allowed,
                        pythagenpat_pct, alpha, preseason_strength, weighted_strength)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    ON CONFLICT (as_of_date, team_id) DO UPDATE SET
                        games_played = EXCLUDED.games_played,
                        runs_scored = EXCLUDED.runs_scored,
                        runs_allowed = EXCLUDED.runs_allowed,
                        pythagenpat_pct = EXCLUDED.pythagenpat_pct,
                        alpha = EXCLUDED.alpha,
                        preseason_strength = EXCLUDED.preseason_strength,
                        weighted_strength = EXCLUDED.weighted_strength;"""

    cur.execute("SELECT k_constant, hfa_constant FROM model_config ORDER BY as_of_date DESC LIMIT 1;")
    k, hfa_beta = cur.fetchone() # hfa_beta unused here, pulled as a formality
    k = float(k)

    season = as_of_date.year
    season_start = date(season, 1, 1)
    cur.execute(aggregation_query, (as_of_date, season_start, as_of_date, season_start, season))
    team_rows = cur.fetchall()

    for team_id, games_played, runs_scored, runs_allowed, preseason_strength in team_rows:
        games_played = float(games_played)
        runs_scored = float(runs_scored)
        runs_allowed = float(runs_allowed)
        preseason_strength = float(preseason_strength)

        pythag = pythagenpat(games_played, runs_scored, runs_allowed)
        alpha = stabilizing_coefficient(games_played, k)
        weighted_strength = weighted_estimate(alpha, preseason_strength, pythag)

        values = (as_of_date, season, team_id, games_played, runs_scored, runs_allowed, pythag, alpha, preseason_strength, weighted_strength)

        cur.execute(upsert_sql, values)

      