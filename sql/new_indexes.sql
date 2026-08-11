CREATE INDEX idx_simulation_batches_season_date_created 
    ON simulation_batches(season, as_of_date, created_at DESC);

CREATE INDEX idx_win_dist_batch 
    ON daily_win_distribution(batch_id);