-- Pulls the full win distribution for a given team on a given day

SELECT final_wins, sim_count, sim_pct
FROM daily_win_distribution
WHERE batch_id = %s AND team_id = %s
ORDER BY final_wins;

