-- Aggregates a team's runs for and runs against over a timeframe. --

SELECT t.team_id,
       COALESCE(SUM(r.games_played), 0) AS games_played,
       COALESCE(SUM(r.runs_scored), 0) AS runs_scored,
       COALESCE(SUM(r.runs_allowed), 0) AS runs_allowed
FROM teams t
LEFT JOIN (
    SELECT home_team_id AS team_id, COUNT(*) as games_played, SUM(home_runs) as runs_scored, SUM(away_runs) as runs_allowed FROM schedule
    WHERE game_date <= %s AND game_date >= %s AND game_status = 'Final'
    GROUP BY team_id
    UNION ALL
    SELECT away_team_id AS team_id, COUNT(*) as games_played, SUM(away_runs) as runs_scored, SUM(home_runs) as runs_allowed FROM schedule
    WHERE game_date <= %s AND game_date >= %s AND game_status = 'Final'
    GROUP BY team_id
) AS r ON r.team_id = t.team_id
GROUP BY t.team_id;