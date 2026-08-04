-- Aggregates a team's runs for and runs against over a timeframe. --

SELECT t.team_id,
       COALESCE(SUM(r.games_played), 0) AS games_played,
       COALESCE(SUM(r.runs_scored), 0) AS runs_scored,
       COALESCE(SUM(r.runs_allowed), 0) AS runs_allowed,
       p.preseason_strength
FROM teams t
LEFT JOIN (
    SELECT home_team_id AS team_id, COUNT(*) as games_played, SUM(home_runs) as runs_scored, SUM(away_runs) as runs_allowed FROM schedule
    WHERE game_date <= %s AND game_date >= %s AND game_status IN ('Final', 'Completed Early')
    GROUP BY team_id
    UNION ALL
    SELECT away_team_id AS team_id, COUNT(*) as games_played, SUM(away_runs) as runs_scored, SUM(home_runs) as runs_allowed FROM schedule
    WHERE game_date <= %s AND game_date >= %s AND game_status IN ('Final', 'Completed Early')
    GROUP BY team_id
) AS r ON r.team_id = t.team_id
LEFT JOIN preseason_estimates p ON p.team_id = t.team_id AND p.season = %s
GROUP BY t.team_id, p.preseason_strength;