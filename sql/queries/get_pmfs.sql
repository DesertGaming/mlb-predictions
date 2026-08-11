-- Pull all canon PMFs

WITH canon_batches AS (
    SELECT DISTINCT ON (as_of_date) batch_id, as_of_date
    FROM simulation_batches
    WHERE season = 2026
    ORDER BY as_of_date, created_at DESC
)
SELECT cb.as_of_date, d.team_id, d.final_wins, d.sim_count, d.sim_pct
FROM canon_batches cb
JOIN daily_win_distribution d ON d.batch_id = cb.batch_id
ORDER BY cb.as_of_date, d.team_id, d.final_wins;