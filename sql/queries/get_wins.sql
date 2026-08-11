-- Edited version of running win total query from backtesting. Altered to pull current season wins only.

WITH cg AS (
    SELECT
        game_id, 
        EXTRACT(YEAR FROM game_date) AS season, 
        home_team_id AS team_id, 
        game_date,
        home_runs AS runs_scored, 
        away_runs AS runs_allowed,
        CASE
          WHEN home_runs > away_runs THEN 1 ELSE 0
        END AS win
    FROM schedule 
    WHERE EXTRACT(YEAR FROM game_date) = %s 
      AND game_status IN ('Final', 'Completed Early')

    UNION ALL 
    
    SELECT
        game_id, 
        EXTRACT(YEAR FROM game_date) AS season, 
        away_team_id AS team_id, 
        game_date,
        away_runs AS runs_scored, 
        home_runs AS runs_allowed,
        CASE
          WHEN away_runs > home_runs THEN 1 ELSE 0
        END AS win
    FROM schedule 
    WHERE EXTRACT(YEAR FROM game_date) = %s
      AND game_status IN ('Final', 'Completed Early')
)
SELECT 
    cg.team_id,
    SUM(cg.runs_scored) OVER(PARTITION BY cg.team_id, cg.season ORDER BY cg.game_date, cg.game_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS runs_scored,
    SUM(cg.runs_allowed) OVER(PARTITION BY cg.team_id, cg.season ORDER BY cg.game_date, cg.game_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS runs_allowed,
    COUNT(*) OVER(PARTITION BY cg.team_id, cg.season ORDER BY cg.game_date, cg.game_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS games_played,
    SUM(cg.win) OVER(PARTITION BY cg.team_id, cg.season ORDER BY cg.game_date, cg.game_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS wins_so_far,
    cg.game_date
FROM cg
ORDER BY cg.team_id, cg.game_date;