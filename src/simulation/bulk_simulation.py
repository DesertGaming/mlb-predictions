from datetime import date, timedelta
from src.db.connection import get_connection
from src.simulation.simulation_logic import sim
import time

current_date = date(2026, 4, 27) - timedelta(days=1)  # adjust to wherever you're resuming from
season_start = date(2026, 3, 25)
n_simulations = 15000

iteration_times = []
failures = []
overall_start = time.time()

conn = get_connection()
cur = conn.cursor()

days_since_reconnect = 0

while current_date >= season_start:
    iter_start = time.time()
    try:
        sim(cur, current_date, n_simulations)
        conn.commit()
        elapsed = time.time() - iter_start
        iteration_times.append(elapsed)
        print(f"{current_date}: done ({elapsed:.2f}s)")
    except Exception as e:
        try:
            conn.rollback()
        except Exception:
            pass  # connection may already be dead; ignore and reconnect below
        elapsed = time.time() - iter_start
        print(f"{current_date}: failed - {e} ({elapsed:.2f}s)")
        failures.append((current_date, str(e)))

        # attempt a fresh connection before continuing
        try:
            cur.close()
            conn.close()
        except Exception:
            pass
        conn = get_connection()
        cur = conn.cursor()

    current_date -= timedelta(days=1)
    days_since_reconnect += 1

    # proactively cycle the connection every 20 days, regardless of failures
    if days_since_reconnect >= 20:
        cur.close()
        conn.close()
        conn = get_connection()
        cur = conn.cursor()
        days_since_reconnect = 0

    time.sleep(0.5)

cur.close()
conn.close()

overall_elapsed = time.time() - overall_start
print(f"\n--- Backfill complete ---")
print(f"Total time: {overall_elapsed:.2f}s")
if iteration_times:
    print(f"Days processed successfully: {len(iteration_times)}")
    print(f"Average per day: {sum(iteration_times) / len(iteration_times):.2f}s")
    print(f"Min: {min(iteration_times):.2f}s")
    print(f"Max: {max(iteration_times):.2f}s")

if failures:
    print(f"\n--- {len(failures)} failures ---")
    for failed_date, error in failures:
        print(f"{failed_date}: {error}")
else:
    print("\nNo failures.")