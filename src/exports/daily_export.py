# Daily data updates exported to CSV for Tableau usage

from datetime import date
from src.db.connection import get_connection
from src.exports.export_matchups import export_matchups
from src.exports.export_pmf_summary import export_summaries
from src.exports.export_strengths import export_strengths
from src.exports.export_wins import export_wins

today = date.today()
season = today.year

with get_connection() as conn:
    with conn.cursor() as cur:
        export_matchups(cur, today)
        export_strengths(cur, season)
        export_wins(cur, season)
        export_summaries(cur, season)
    conn.commit()

conn.close()

