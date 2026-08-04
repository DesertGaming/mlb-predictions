# Daily Strength Calculation and Update

from datetime import date, timedelta
from src.db.connection import get_connection
from src.data_pipeline.calculate_strengths import calculate_strengths

today = date.today() - timedelta(days=1)

with get_connection() as conn:
    with conn.cursor() as cur:
        calculate_strengths(cur, today)
    conn.commit()

conn.close()
