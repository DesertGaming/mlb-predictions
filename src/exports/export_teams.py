# Query to pull team data and write to a csv file for export

import os
import csv

def export_teams(cur):

    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    CSV_PATH = os.path.join(BASE_DIR, "..", "..", "exports", "teams.csv")

    pull_query = "SELECT team_id, team_abbr, team_name, league, division FROM teams;"

    cur.execute(pull_query)

    headers = [description[0] for description in cur.description]

    with open(CSV_PATH, mode="w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        
        writer.writerow(headers)

        writer.writerows(cur)

if __name__ == "__main__":
    from src.db.connection import get_connection

    with get_connection() as conn:
        with conn.cursor() as cur:
            export_teams(cur)
    conn.close()
