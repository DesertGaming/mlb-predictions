INSERT INTO model_config 
VALUES ('2026-07-29', 40, 0.025, 0.05, 0.95, 'Initial parameters coming from stabilization research and current HFA trends')
ON CONFLICT (as_of_date) DO NOTHING;

INSERT INTO model_config 
VALUES ('2026-08-05', 120, 0.025, 0.05, 0.95, 'K updated to reflect linear extrapolation backtest using previous seasons')
ON CONFLICT (as_of_date) DO NOTHING;