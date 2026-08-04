# Bulk Calculating Daily Strength for 2026

from datetime import date, timedelta
from src.db.connection import get_connection
from src.data_pipeline.calculate_strengths import calculate_strengths
import time

current_date = date.today()
season_start = date(2026, 3, 25)

with get_connection() as conn:
    with conn.cursor() as cur:
        while current_date >= season_start:
            try:
                calculate_strengths(cur, current_date)
                conn.commit() # commits after each successful daily calculation
            except Exception as e:
                conn.rollback() # undo partial work from a failed day
                print(f"{current_date}: failed - {e}")
            current_date -= timedelta(days=1)
            time.sleep(0.5)
            
conn.close()