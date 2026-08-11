# Query to pull weighted strengths and write to a csv file for export

import os
import csv

def export_strengths(cur, season):

    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    CSV_PATH = os.path.join(BASE_DIR, "..", "..", "exports", "strengths.csv")

    pull_query = "SELECT as_of_date, team_id, pythagenpat_pct, weighted_strength FROM daily_team_strength WHERE season = %s ORDER BY as_of_date, team_id;"

    cur.execute(pull_query, (season, ))

    headers = [description[0] for description in cur.description]

    with open(CSV_PATH, mode="w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        
        writer.writerow(headers)

        writer.writerows(cur)

if __name__ == "__main__":
    from src.db.connection import get_connection

    with get_connection() as conn:
        with conn.cursor() as cur:
            export_strengths(cur, 2026)
    conn.close()
