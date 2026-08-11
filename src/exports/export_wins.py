# Query to pull running win totals and write to a csv file for export

import os
import csv

def export_wins(cur, season):

    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    CSV_PATH = os.path.join(BASE_DIR, "..", "..", "exports", "wins.csv")
    QUERY_PATH = os.path.join(BASE_DIR, "..", "..", "sql", "queries", "get_wins.sql")
    
    with open(QUERY_PATH, "r") as q:
        pull_query = q.read()
    
    cur.execute(pull_query, (season, season))

    headers = [description[0] for description in cur.description]

    with open(CSV_PATH, mode="w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        
        writer.writerow(headers)

        writer.writerows(cur)

if __name__ == "__main__":
    from src.db.connection import get_connection

    with get_connection() as conn:
        with conn.cursor() as cur:
            export_wins(cur, 2026)
    conn.close()