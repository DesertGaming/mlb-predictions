# Query to pull pull daily matchups, calculated win expectation, and write to a csv file for export

import os
import csv
from src.simulation.log5 import log5, apply_hfa
from datetime import date

def export_matchups(cur, as_of_date):

    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    CSV_PATH = os.path.join(BASE_DIR, "..", "..", "exports", "matchups.csv")

    pull_query = """WITH matchups AS (
                        SELECT game_date, home_team_id, away_team_id FROM schedule WHERE game_date = %s
                    )
                    SELECT m.home_team_id, m.away_team_id, sh.weighted_strength as home_strength, sa.weighted_strength as away_strength
                    FROM matchups m
                    LEFT JOIN daily_team_strength sh
                        ON m.home_team_id = sh.team_id
                        AND sh.as_of_date = m.game_date - INTERVAL '1 day'
                    LEFT JOIN daily_team_strength sa
                        ON m.away_team_id = sa.team_id
                        AND sa.as_of_date = m.game_date - INTERVAL '1 day';"""

    cur.execute("SELECT k_constant, hfa_constant, prob_floor, prob_ceiling FROM model_config ORDER BY as_of_date DESC LIMIT 1;")
    _k, beta, prob_floor, prob_ceiling = cur.fetchone()
    beta = float(beta)
    prob_floor = float(prob_floor)
    prob_ceiling = float(prob_ceiling)

    cur.execute(pull_query, (as_of_date, ))
    games = cur.fetchall()

    headers = ["home_team_id", "away_team_id", "home_win_prob"]

    with open(CSV_PATH, mode="w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        
        writer.writerow(headers)

        for home_team_id, away_team_id, home_strength, away_strength in games:
            home_strength = float(home_strength)
            away_strength = float(away_strength)
            raw_win_prob = log5(home_strength, away_strength)
            home_win_prob = apply_hfa(raw_win_prob, beta, prob_floor, prob_ceiling)
            writer.writerow([home_team_id, away_team_id, home_win_prob])

if __name__ == "__main__":
    from src.db.connection import get_connection

    with get_connection() as conn:
        with conn.cursor() as cur:
            export_matchups(cur, date(2026, 8, 10))
    conn.close()
