# Daily Simulation Mechanism and Updating

from datetime import date, timedelta
from src.db.connection import get_connection
from src.simulation.simulation_logic import sim
import time

today = date.today() - timedelta(days=1)
n = 15000

with get_connection() as conn:
    with conn.cursor() as cur:
        start = time.time()
        sim(cur, today, n)
        end = time.time()
    conn.commit()

conn.close()

print(f"Simulation took {end - start:.2f} seconds")