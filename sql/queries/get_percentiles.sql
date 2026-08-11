-- Returns summary statistics for each canon sim batch

WITH canon_batches AS (
    SELECT DISTINCT ON (as_of_date) batch_id, as_of_date
    FROM simulation_batches
    WHERE season = %s
    ORDER BY as_of_date, created_at DESC
),
dist AS (
    SELECT cb.as_of_date, d.team_id, d.final_wins, d.sim_pct,
           SUM(d.sim_pct) OVER (
               PARTITION BY cb.as_of_date, d.team_id 
               ORDER BY d.final_wins
           ) AS cum_pct
    FROM canon_batches cb
    JOIN daily_win_distribution d ON d.batch_id = cb.batch_id
),
means AS (
    SELECT as_of_date, team_id, SUM(final_wins * sim_pct) AS mean_wins
    FROM dist
    GROUP BY as_of_date, team_id
),
p10 AS (
    SELECT DISTINCT ON (as_of_date, team_id) as_of_date, team_id, final_wins AS p10_wins
    FROM dist
    WHERE cum_pct >= 0.10
    ORDER BY as_of_date, team_id, final_wins
),
p25 AS (
    SELECT DISTINCT ON (as_of_date, team_id) as_of_date, team_id, final_wins AS p25_wins
    FROM dist
    WHERE cum_pct >= 0.25
    ORDER BY as_of_date, team_id, final_wins
),
p75 AS (
    SELECT DISTINCT ON (as_of_date, team_id) as_of_date, team_id, final_wins AS p75_wins
    FROM dist
    WHERE cum_pct >= 0.75
    ORDER BY as_of_date, team_id, final_wins
),
p90 AS (
    SELECT DISTINCT ON (as_of_date, team_id) as_of_date, team_id, final_wins AS p90_wins
    FROM dist
    WHERE cum_pct >= 0.90
    ORDER BY as_of_date, team_id, final_wins
)
SELECT m.as_of_date, m.team_id, m.mean_wins, p10.p10_wins, p25.p25_wins, p75.p75_wins, p90.p90_wins
FROM means m
JOIN p10 ON p10.as_of_date = m.as_of_date AND p10.team_id = m.team_id
JOIN p25 ON p25.as_of_date = m.as_of_date AND p25.team_id = m.team_id
JOIN p75 ON p75.as_of_date = m.as_of_date AND p75.team_id = m.team_id
JOIN p90 ON p90.as_of_date = m.as_of_date AND p90.team_id = m.team_id
ORDER BY m.team_id, m.as_of_date;