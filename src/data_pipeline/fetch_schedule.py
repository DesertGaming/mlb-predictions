# Daily Schedule Fetching

import requests
from datetime import date, timedelta
from src.db.connection import get_connection

today = date.today()
yesterday = today - timedelta(days=1)
start_str = yesterday.isoformat()
end_str = today.isoformat()

url = "https://statsapi.mlb.com/api/v1/schedule"

upsert_sql = """INSERT INTO schedule (game_id, season, game_date, home_team_id, away_team_id, game_status, home_runs, away_runs)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                ON CONFLICT (game_id)
                DO UPDATE SET
                    game_status = EXCLUDED.game_status,
                    home_runs = EXCLUDED.home_runs,
                    away_runs = EXCLUDED.away_runs;"""

response = requests.get(url, params={"sportId": 1, "startDate": start_str, "endDate": end_str})
data = response.json()

with get_connection() as conn:
    with conn.cursor() as cur:
        for date_entry in data.get("dates", []):
            for game in date_entry.get("games", []):
                game_id = game["gamePk"]
                game_date = game["officialDate"]
                season = int(game["season"])
                game_status = game["status"]["detailedState"]

                home_team_id = game["teams"]["home"]["team"]["id"]
                away_team_id = game["teams"]["away"]["team"]["id"]

                # scores may not exist yet if the game hasn't started/finished
                home_runs = game["teams"]["home"].get("score")
                away_runs = game["teams"]["away"].get("score")

                values = (game_id, season, game_date, home_team_id, away_team_id, game_status, home_runs, away_runs)

                cur.execute(upsert_sql, values)

    conn.commit()

