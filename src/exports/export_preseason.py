# Query to pull preseason strengths and write to a csv file for export

import os
import csv

def export_preseason_data(cur, season):

    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    CSV_PATH = os.path.join(BASE_DIR, "..", "..", "exports", "preseason_data.csv")

    pull_query = "SELECT team_id, preseason_strength FROM preseason_estimates WHERE season = %s ORDER BY team_id;"

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
            export_preseason_data(cur, 2026)
    conn.close()
