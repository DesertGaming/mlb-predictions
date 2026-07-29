# Bulk Fetching Complete Schedules by Season

from datetime import date
from src.db.connection import get_connection
from src.data_pipeline.fetch_and_upsert import fetch_and_upsert
import time

seasons = [2019, 2021, 2022, 2023, 2024, 2025, 2026]

with get_connection() as conn:
    with conn.cursor() as cur:
        for season in seasons:
            try:
                fetch_and_upsert(cur, date(season, 1, 1), date(season, 12, 31))
                conn.commit() # commits after each successful season
                print(f"{season}: done")
            except Exception as e:
                conn.rollback() # undo partial work from a failed season
                print(f"{season}: failed - {e}")
            time.sleep(1)
            
conn.close()