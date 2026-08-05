-- Seeding static pre-season win estimates --


-- Dodgers
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 103.5, 103.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'LAD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 105.5, 105.5/162, 'BetMGM Dodgers Summary, 2026-03-24'
FROM teams where team_abbr = 'LAD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 103.5, 103.5/162, 'BetMGM Dodgers Summary, 2026-03-24'
FROM teams where team_abbr = 'LAD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 95.5, 95.5/162, 'BetMGM Dodgers Summary, 2026-03-24'
FROM teams where team_abbr = 'LAD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 98.5, 98.5/162, 'BetMGM Dodgers Summary, 2026-03-24'
FROM teams where team_abbr = 'LAD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 102.5, 102.5/162, 'BetMGM Dodgers Summary, 2026-03-24'
FROM teams where team_abbr = 'LAD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 93.5, 93.5/162, 'BetMGM Dodgers Summary, 2026-03-24'
FROM teams where team_abbr = 'LAD'
ON CONFLICT (season, team_id) DO NOTHING;

-- Yankees
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 90.5, 90.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'NYY'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 88.5, 88.5/162, 'BetMGM Yankees Summary, 2026-03-24'
FROM teams where team_abbr = 'NYY'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 91.5, 91.5/162, 'BetMGM Yankees Summary, 2026-03-24'
FROM teams where team_abbr = 'NYY'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 94.5, 94.5/162, 'BetMGM Yankees Summary, 2026-03-24'
FROM teams where team_abbr = 'NYY'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 91.5, 91.5/162, 'BetMGM Yankees Summary, 2026-03-24'
FROM teams where team_abbr = 'NYY'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 95.5, 95.5/162, 'BetMGM Yankees Summary, 2026-03-24'
FROM teams where team_abbr = 'NYY'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 96.5, 96.5/162, 'BetMGM Yankees Summary, 2026-03-24'
FROM teams where team_abbr = 'NYY'
ON CONFLICT (season, team_id) DO NOTHING;

-- Mets
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 90.5, 90.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'NYM'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 90.5, 90.5/162, 'BetMGM Mets Summary, 2026-03-24'
FROM teams where team_abbr = 'NYM'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 81.5, 81.5/162, 'BetMGM Mets Summary, 2026-03-24'
FROM teams where team_abbr = 'NYM'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 92.5, 92.5/162, 'BetMGM Mets Summary, 2026-03-24'
FROM teams where team_abbr = 'NYM'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 88.5, 88.5/162, 'BetMGM Mets Summary, 2026-03-24'
FROM teams where team_abbr = 'NYM'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 90.5, 90.5/162, 'BetMGM Mets Summary, 2026-03-24'
FROM teams where team_abbr = 'NYM'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 85.5, 85.5/162, 'BetMGM Mets Summary, 2026-03-24'
FROM teams where team_abbr = 'NYM'
ON CONFLICT (season, team_id) DO NOTHING;

-- Mariners
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 89.5, 89.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'SEA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 85.5, 85.5/162, 'BetMGM Mariners Summary, 2026-03-24'
FROM teams where team_abbr = 'SEA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 87.5, 87.5/162, 'BetMGM Mariners Summary, 2026-03-24'
FROM teams where team_abbr = 'SEA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 87.5, 87.5/162, 'BetMGM Mariners Summary, 2026-03-24'
FROM teams where team_abbr = 'SEA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 84.5, 84.5/162, 'BetMGM Mariners Summary, 2026-03-24'
FROM teams where team_abbr = 'SEA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 72.5, 72.5/162, 'BetMGM Mariners Summary, 2026-03-24'
FROM teams where team_abbr = 'SEA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 71.5, 71.5/162, 'BetMGM Mariners Summary, 2026-03-24'
FROM teams where team_abbr = 'SEA'
ON CONFLICT (season, team_id) DO NOTHING;

-- Phillies
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 89.5, 89.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'PHI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 90.5, 90.5/162, 'BetMGM Phillies Summary, 2026-03-24'
FROM teams where team_abbr = 'PHI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 89.5, 89.5/162, 'BetMGM Phillies Summary, 2026-03-24'
FROM teams where team_abbr = 'PHI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 88.5, 88.5/162, 'BetMGM Phillies Summary, 2026-03-24'
FROM teams where team_abbr = 'PHI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 86.5, 86.5/162, 'BetMGM Phillies Summary, 2026-03-24'
FROM teams where team_abbr = 'PHI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 80.5, 80.5/162, 'BetMGM Phillies Summary, 2026-03-24'
FROM teams where team_abbr = 'PHI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 89.5, 89.5/162, 'BetMGM Phillies Summary, 2026-03-24'
FROM teams where team_abbr = 'PHI'
ON CONFLICT (season, team_id) DO NOTHING;

-- Cubs
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 88.5, 88.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'CHC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 86.5, 86.5/162, 'BetMGM Cubs Summary, 2026-03-24'
FROM teams where team_abbr = 'CHC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 84.5, 84.5/162, 'BetMGM Cubs Summary, 2026-03-24'
FROM teams where team_abbr = 'CHC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 77.5, 77.5/162, 'BetMGM Cubs Summary, 2026-03-24'
FROM teams where team_abbr = 'CHC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 74.5, 74.5/162, 'BetMGM Cubs Summary, 2026-03-24'
FROM teams where team_abbr = 'CHC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 78.5, 78.5/162, 'BetMGM Cubs Summary, 2026-03-24'
FROM teams where team_abbr = 'CHC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 87.5, 87.5/162, 'BetMGM Cubs Summary, 2026-03-24'
FROM teams where team_abbr = 'CHC'
ON CONFLICT (season, team_id) DO NOTHING;

-- Blue Jays
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 88.5, 88.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'TOR'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 79.5, 79.5/162, 'BetMGM Blue Jays Summary, 2026-03-24'
FROM teams where team_abbr = 'TOR'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 87.5, 87.5/162, 'BetMGM Blue Jays Summary, 2026-03-24'
FROM teams where team_abbr = 'TOR'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 91.5, 91.5/162, 'BetMGM Blue Jays Summary, 2026-03-24'
FROM teams where team_abbr = 'TOR'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 92.5, 92.5/162, 'BetMGM Blue Jays Summary, 2026-03-24'
FROM teams where team_abbr = 'TOR'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 86.5, 86.5/162, 'BetMGM Blue Jays Summary, 2026-03-24'
FROM teams where team_abbr = 'TOR'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 74.5, 74.5/162, 'BetMGM Blue Jays Summary, 2026-03-24'
FROM teams where team_abbr = 'TOR'
ON CONFLICT (season, team_id) DO NOTHING;

-- Red Sox
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 87.5, 87.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'BOS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 86.5, 86.5/162, 'BetMGM Red Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'BOS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 77.5, 77.5/162, 'BetMGM Red Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'BOS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 78.5, 78.5/162, 'BetMGM Red Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'BOS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 85.5, 85.5/162, 'BetMGM Red Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'BOS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 80.5, 80.5/162, 'BetMGM Red Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'BOS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 94.5, 94.5/162, 'BetMGM Red Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'BOS'
ON CONFLICT (season, team_id) DO NOTHING;

-- Astros
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 86.5, 86.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'HOU'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 86.5, 86.5/162, 'BetMGM Astros Summary, 2026-03-24'
FROM teams where team_abbr = 'HOU'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 92.5, 92.5/162, 'BetMGM Astros Summary, 2026-03-24'
FROM teams where team_abbr = 'HOU'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 95.5, 95.5/162, 'BetMGM Astros Summary, 2026-03-24'
FROM teams where team_abbr = 'HOU'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 91.5, 91.5/162, 'BetMGM Astros Summary, 2026-03-24'
FROM teams where team_abbr = 'HOU'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 87.5, 87.5/162, 'BetMGM Astros Summary, 2026-03-24'
FROM teams where team_abbr = 'HOU'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 96.5, 96.5/162, 'BetMGM Astros Summary, 2026-03-24'
FROM teams where team_abbr = 'HOU'
ON CONFLICT (season, team_id) DO NOTHING;

-- Braves
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 86.5, 86.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'ATL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 93.5, 93.5/162, 'BetMGM Braves Summary, 2026-03-24'
FROM teams where team_abbr = 'ATL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 101.5, 101.5/162, 'BetMGM Braves Summary, 2026-03-24'
FROM teams where team_abbr = 'ATL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 95.5, 95.5/162, 'BetMGM Braves Summary, 2026-03-24'
FROM teams where team_abbr = 'ATL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 91.5, 91.5/162, 'BetMGM Braves Summary, 2026-03-24'
FROM teams where team_abbr = 'ATL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 91.5, 91.5/162, 'BetMGM Braves Summary, 2026-03-24'
FROM teams where team_abbr = 'ATL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 86.0, 86.0/162, 'BetMGM Braves Summary, 2026-03-24'
FROM teams where team_abbr = 'ATL'
ON CONFLICT (season, team_id) DO NOTHING;

-- Orioles
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 85.5, 85.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'BAL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 86.5, 86.5/162, 'BetMGM Orioles Summary, 2026-03-24'
FROM teams where team_abbr = 'BAL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 90.5, 90.5/162, 'BetMGM Orioles Summary, 2026-03-24'
FROM teams where team_abbr = 'BAL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 77.5, 77.5/162, 'BetMGM Orioles Summary, 2026-03-24'
FROM teams where team_abbr = 'BAL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 62.5, 62.5/162, 'BetMGM Orioles Summary, 2026-03-24'
FROM teams where team_abbr = 'BAL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 64.5, 64.5/162, 'BetMGM Orioles Summary, 2026-03-24'
FROM teams where team_abbr = 'BAL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 58.5, 58.5/162, 'BetMGM Orioles Summary, 2026-03-24'
FROM teams where team_abbr = 'BAL'
ON CONFLICT (season, team_id) DO NOTHING;

-- Tigers
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 85.5, 85.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'DET'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 83.5, 83.5/162, 'BetMGM Tigers Summary, 2026-03-24'
FROM teams where team_abbr = 'DET'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 81.5, 81.5/162, 'BetMGM Tigers Summary, 2026-03-24'
FROM teams where team_abbr = 'DET'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 69.5, 69.5/162, 'BetMGM Tigers Summary, 2026-03-24'
FROM teams where team_abbr = 'DET'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 78.5, 78.5/162, 'BetMGM Tigers Summary, 2026-03-24'
FROM teams where team_abbr = 'DET'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 69.5, 69.5/162, 'BetMGM Tigers Summary, 2026-03-24'
FROM teams where team_abbr = 'DET'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 68.5, 68.5/162, 'BetMGM Tigers Summary, 2026-03-24'
FROM teams where team_abbr = 'DET'
ON CONFLICT (season, team_id) DO NOTHING;

-- Brewers
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 84.5, 84.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'MIL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 82.5, 82.5/162, 'BetMGM Brewers Summary, 2026-03-24'
FROM teams where team_abbr = 'MIL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 77.5, 77.5/162, 'BetMGM Brewers Summary, 2026-03-24'
FROM teams where team_abbr = 'MIL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 85.5, 85.5/162, 'BetMGM Brewers Summary, 2026-03-24'
FROM teams where team_abbr = 'MIL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 90.5, 90.5/162, 'BetMGM Brewers Summary, 2026-03-24'
FROM teams where team_abbr = 'MIL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 83.5, 83.5/162, 'BetMGM Brewers Summary, 2026-03-24'
FROM teams where team_abbr = 'MIL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 86.5, 86.5/162, 'BetMGM Brewers Summary, 2026-03-24'
FROM teams where team_abbr = 'MIL'
ON CONFLICT (season, team_id) DO NOTHING;

-- Rangers
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 83.5, 83.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'TEX'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 86.5, 86.5/162, 'BetMGM Rangers Summary, 2026-03-24'
FROM teams where team_abbr = 'TEX'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 88.5, 88.5/162, 'BetMGM Rangers Summary, 2026-03-24'
FROM teams where team_abbr = 'TEX'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 81.5, 81.5/162, 'BetMGM Rangers Summary, 2026-03-24'
FROM teams where team_abbr = 'TEX'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 74.5, 74.5/162, 'BetMGM Rangers Summary, 2026-03-24'
FROM teams where team_abbr = 'TEX'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 67.5, 67.5/162, 'BetMGM Rangers Summary, 2026-03-24'
FROM teams where team_abbr = 'TEX'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 71.5, 71.5/162, 'BetMGM Rangers Summary, 2026-03-24'
FROM teams where team_abbr = 'TEX'
ON CONFLICT (season, team_id) DO NOTHING;

-- Padres
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 83.5, 83.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'SD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 85.5, 85.5/162, 'BetMGM Padres Summary, 2026-03-24'
FROM teams where team_abbr = 'SD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 83.5, 83.5/162, 'BetMGM Padres Summary, 2026-03-24'
FROM teams where team_abbr = 'SD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 93.5, 93.5/162, 'BetMGM Padres Summary, 2026-03-24'
FROM teams where team_abbr = 'SD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 88.5, 88.5/162, 'BetMGM Padres Summary, 2026-03-24'
FROM teams where team_abbr = 'SD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 94.5, 94.5/162, 'BetMGM Padres Summary, 2026-03-24'
FROM teams where team_abbr = 'SD'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 78.5, 78.5/162, 'BetMGM Padres Summary, 2026-03-24'
FROM teams where team_abbr = 'SD'
ON CONFLICT (season, team_id) DO NOTHING;

-- Royals
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 82.5, 82.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'KC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 82.5, 82.5/162, 'BetMGM Royals Summary, 2026-03-24'
FROM teams where team_abbr = 'KC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 73.5, 73.5/162, 'BetMGM Royals Summary, 2026-03-24'
FROM teams where team_abbr = 'KC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 69.5, 69.5/162, 'BetMGM Royals Summary, 2026-03-24'
FROM teams where team_abbr = 'KC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 74.5, 74.5/162, 'BetMGM Royals Summary, 2026-03-24'
FROM teams where team_abbr = 'KC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 74.5, 74.5/162, 'BetMGM Royals Summary, 2026-03-24'
FROM teams where team_abbr = 'KC'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 69.5, 69.5/162, 'BetMGM Royals Summary, 2026-03-24'
FROM teams where team_abbr = 'KC'
ON CONFLICT (season, team_id) DO NOTHING;

--Giants
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 80.5, 80.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'SF'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 79.5, 79.5/162, 'BetMGM Giants Summary, 2026-03-24'
FROM teams where team_abbr = 'SF'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 83.5, 83.5/162, 'BetMGM Giants Summary, 2026-03-24'
FROM teams where team_abbr = 'SF'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 80.5, 80.5/162, 'BetMGM Giants Summary, 2026-03-24'
FROM teams where team_abbr = 'SF'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 86.5, 86.5/162, 'BetMGM Giants Summary, 2026-03-24'
FROM teams where team_abbr = 'SF'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 75.5, 75.5/162, 'BetMGM Giants Summary, 2026-03-24'
FROM teams where team_abbr = 'SF'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 73.5, 73.5/162, 'BetMGM Giants Summary, 2026-03-24'
FROM teams where team_abbr = 'SF'
ON CONFLICT (season, team_id) DO NOTHING;

-- Reds
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 80.5, 80.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'CIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 79.5, 79.5/162, 'BetMGM Reds Summary, 2026-03-24'
FROM teams where team_abbr = 'CIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 82.5, 82.5/162, 'BetMGM Reds Summary, 2026-03-24'
FROM teams where team_abbr = 'CIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 65.5, 65.5/162, 'BetMGM Reds Summary, 2026-03-24'
FROM teams where team_abbr = 'CIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 73.5, 73.5/162, 'BetMGM Reds Summary, 2026-03-24'
FROM teams where team_abbr = 'CIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 81.5, 81.5/162, 'BetMGM Reds Summary, 2026-03-24'
FROM teams where team_abbr = 'CIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 78.5, 78.5/162, 'BetMGM Reds Summary, 2026-03-24'
FROM teams where team_abbr = 'CIN'
ON CONFLICT (season, team_id) DO NOTHING;

-- Diamondbacks
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 79.5, 79.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'ARI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 86.5, 86.5/162, 'BetMGM Diamondbacks Summary, 2026-03-24'
FROM teams where team_abbr = 'ARI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 84.5, 84.5/162, 'BetMGM Diamondbacks Summary, 2026-03-24'
FROM teams where team_abbr = 'ARI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 75.5, 75.5/162, 'BetMGM Diamondbacks Summary, 2026-03-24'
FROM teams where team_abbr = 'ARI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 66.5, 66.5/162, 'BetMGM Diamondbacks Summary, 2026-03-24'
FROM teams where team_abbr = 'ARI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 75.5, 75.5/162, 'BetMGM Diamondbacks Summary, 2026-03-24'
FROM teams where team_abbr = 'ARI'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 75.5, 75.5/162, 'BetMGM Diamondbacks Summary, 2026-03-24'
FROM teams where team_abbr = 'ARI'
ON CONFLICT (season, team_id) DO NOTHING;

-- Guardians
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 79.5, 79.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'CLE'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 82.5, 82.5/162, 'BetMGM Guardians Summary, 2026-03-24'
FROM teams where team_abbr = 'CLE'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 79.5, 79.5/162, 'BetMGM Guardians Summary, 2026-03-24'
FROM teams where team_abbr = 'CLE'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 86.5, 86.5/162, 'BetMGM Guardians Summary, 2026-03-24'
FROM teams where team_abbr = 'CLE'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 76.5, 76.5/162, 'BetMGM Guardians Summary, 2026-03-24'
FROM teams where team_abbr = 'CLE'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 81.5, 81.5/162, 'BetMGM Guardians Summary, 2026-03-24'
FROM teams where team_abbr = 'CLE'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 90.5, 90.5/162, 'BetMGM Guardians Summary, 2026-03-24'
FROM teams where team_abbr = 'CLE'
ON CONFLICT (season, team_id) DO NOTHING;

-- Pirates
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 78.5, 78.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'PIT'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 76.5, 76.5/162, 'BetMGM Pirates Summary, 2026-03-24'
FROM teams where team_abbr = 'PIT'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 75.5, 75.5/162, 'BetMGM Pirates Summary, 2026-03-24'
FROM teams where team_abbr = 'PIT'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 67.5, 67.5/162, 'BetMGM Pirates Summary, 2026-03-24'
FROM teams where team_abbr = 'PIT'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 64.5, 64.5/162, 'BetMGM Pirates Summary, 2026-03-24'
FROM teams where team_abbr = 'PIT'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 58.5, 58.5/162, 'BetMGM Pirates Summary, 2026-03-24'
FROM teams where team_abbr = 'PIT'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 77.5, 77.5/162, 'BetMGM Pirates Summary, 2026-03-24'
FROM teams where team_abbr = 'PIT'
ON CONFLICT (season, team_id) DO NOTHING;

-- Rays
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 76.5, 76.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'TB'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 80.5, 80.5/162, 'BetMGM Rays Summary, 2026-03-24'
FROM teams where team_abbr = 'TB'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 85.5, 85.5/162, 'BetMGM Rays Summary, 2026-03-24'
FROM teams where team_abbr = 'TB'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 88.5, 88.5/162, 'BetMGM Rays Summary, 2026-03-24'
FROM teams where team_abbr = 'TB'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 89.5, 89.5/162, 'BetMGM Rays Summary, 2026-03-24'
FROM teams where team_abbr = 'TB'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 86.5, 86.5/162, 'BetMGM Rays Summary, 2026-03-24'
FROM teams where team_abbr = 'TB'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 84.5, 84.5/162, 'BetMGM Rays Summary, 2026-03-24'
FROM teams where team_abbr = 'TB'
ON CONFLICT (season, team_id) DO NOTHING;

-- A's
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 75.5, 75.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'ATH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 71.5, 71.5/162, 'BetMGM Athletics Summary, 2026-03-24'
FROM teams where team_abbr = 'ATH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 57.5, 57.5/162, 'BetMGM Athletics Summary, 2026-03-24'
FROM teams where team_abbr = 'ATH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 59.5, 59.5/162, 'BetMGM Athletics Summary, 2026-03-24'
FROM teams where team_abbr = 'ATH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 68.5, 68.5/162, 'BetMGM Athletics Summary, 2026-03-24'
FROM teams where team_abbr = 'ATH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 87.5, 87.5/162, 'BetMGM Athletics Summary, 2026-03-24'
FROM teams where team_abbr = 'ATH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 83.5, 83.5/162, 'BetMGM Athletics Summary, 2026-03-24'
FROM teams where team_abbr = 'ATH'
ON CONFLICT (season, team_id) DO NOTHING;

-- Twins
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 72.5, 72.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'MIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 84.5, 84.5/162, 'BetMGM Twins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 86.5, 86.5/162, 'BetMGM Twins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 84.5, 84.5/162, 'BetMGM Twins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 82.5, 82.5/162, 'BetMGM Twins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 88.5, 88.5/162, 'BetMGM Twins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIN'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 83.5, 83.5/162, 'BetMGM Twins, 2026-03-24'
FROM teams where team_abbr = 'MIN'
ON CONFLICT (season, team_id) DO NOTHING;

-- Marlins
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 72.5, 72.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'MIA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 62.5, 62.5/162, 'BetMGM Marlins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 77.5, 77.5/162, 'BetMGM Marlins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 76.5, 76.5/162, 'BetMGM Marlins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 76.5, 76.5/162, 'BetMGM Marlins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 70.5, 70.5/162, 'BetMGM Marlins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 63.5, 63.5/162, 'BetMGM Marlins Summary, 2026-03-24'
FROM teams where team_abbr = 'MIA'
ON CONFLICT (season, team_id) DO NOTHING;

-- Angels
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 70.5, 70.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'LAA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 72.5, 72.5/162, 'BetMGM Angels Summary, 2026-03-24'
FROM teams where team_abbr = 'LAA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 72.5, 72.5/162, 'BetMGM Angels Summary, 2026-03-24'
FROM teams where team_abbr = 'LAA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 82.5, 82.5/162, 'BetMGM Angels Summary, 2026-03-24'
FROM teams where team_abbr = 'LAA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 84.5, 84.5/162, 'BetMGM Angels Summary, 2026-03-24'
FROM teams where team_abbr = 'LAA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 83.5, 83.5/162, 'BetMGM Angels Summary, 2026-03-24'
FROM teams where team_abbr = 'LAA'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 82.5, 82.5/162, 'BetMGM Angels Summary, 2026-03-24'
FROM teams where team_abbr = 'LAA'
ON CONFLICT (season, team_id) DO NOTHING;

-- Cardinals
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 69.5, 69.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'STL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 76.5, 76.5/162, 'BetMGM Cardinals Summary, 2026-03-24'
FROM teams where team_abbr = 'STL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 84.5, 84.5/162, 'BetMGM Cardinals Summary, 2026-03-24'
FROM teams where team_abbr = 'STL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 89.5, 89.5/162, 'BetMGM Cardinals Summary, 2026-03-24'
FROM teams where team_abbr = 'STL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 84.5, 84.5/162, 'BetMGM Cardinals Summary, 2026-03-24'
FROM teams where team_abbr = 'STL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 86.5, 86.5/162, 'BetMGM Cardinals Summary, 2026-03-24'
FROM teams where team_abbr = 'STL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 88.5, 88.5/162, 'BetMGM Cardinals Summary, 2026-03-24'
FROM teams where team_abbr = 'STL'
ON CONFLICT (season, team_id) DO NOTHING;

-- White Sox
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 67.5, 67.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'CWS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 54.5, 54.5/162, 'BetMGM White Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'CWS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 61.5, 61.5/162, 'BetMGM White Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'CWS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 82.5, 82.5/162, 'BetMGM White Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'CWS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 92.5, 92.5/162, 'BetMGM White Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'CWS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 90.5, 90.5/162, 'BetMGM White Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'CWS'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 73.5, 73.5/162, 'BetMGM White Sox Summary, 2026-03-24'
FROM teams where team_abbr = 'CWS'
ON CONFLICT (season, team_id) DO NOTHING;

-- Nationals
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 65.5, 65.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'WSH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 70.5, 70.5/162, 'BetMGM Nationals Summary, 2026-03-24'
FROM teams where team_abbr = 'WSH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 66.5, 66.5/162, 'BetMGM Nationals Summary, 2026-03-24'
FROM teams where team_abbr = 'WSH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 59.5, 59.5/162, 'BetMGM Nationals Summary, 2026-03-24'
FROM teams where team_abbr = 'WSH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 70.5, 70.5/162, 'BetMGM Nationals Summary, 2026-03-24'
FROM teams where team_abbr = 'WSH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 84.5, 84.5/162, 'BetMGM Nationals Summary, 2026-03-24'
FROM teams where team_abbr = 'WSH'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 89.0, 89.0/162, 'BetMGM Nationals Summary, 2026-03-24'
FROM teams where team_abbr = 'WSH'
ON CONFLICT (season, team_id) DO NOTHING;

-- Rockies
INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2026, team_id, 55.5, 55.5/162, 'BetMGM, 2026-03-24'
FROM teams where team_abbr = 'COL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2025, team_id, 59.5, 59.5/162, 'BetMGM Rockies Summary, 2026-03-24'
FROM teams where team_abbr = 'COL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2024, team_id, 59.5, 59.5/162, 'BetMGM Rockies Summary, 2026-03-24'
FROM teams where team_abbr = 'COL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2023, team_id, 65.5, 65.5/162, 'BetMGM Rockies Summary, 2026-03-24'
FROM teams where team_abbr = 'COL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2022, team_id, 69.5, 69.5/162, 'BetMGM Rockies Summary, 2026-03-24'
FROM teams where team_abbr = 'COL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2021, team_id, 63.5, 63.5/162, 'BetMGM Rockies Summary, 2026-03-24'
FROM teams where team_abbr = 'COL'
ON CONFLICT (season, team_id) DO NOTHING;

INSERT INTO preseason_estimates (season, team_id, vegas_win_line, preseason_strength, source)
SELECT 2019, team_id, 84.5, 84.5/162, 'BetMGM Rockies Summary, 2026-03-24'
FROM teams where team_abbr = 'COL'
ON CONFLICT (season, team_id) DO NOTHING;