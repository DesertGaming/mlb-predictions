# Daily Results Fetching

from datetime import date, timedelta
from src.db.connection import get_connection
from src.data_pipeline.fetch_and_upsert import fetch_and_upsert

today = date.today()
yesterday = today - timedelta(days=1)

with get_connection() as conn:
    with conn.cursor() as cur:
        fetch_and_upsert(cur, yesterday, today)
    conn.commit()

conn.close()
