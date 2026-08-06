-- Updating Schema to fit new structure for saving simulation batches:
-- 1) Autogenerating a batch_id
-- 2) Removing constraint to allow multiple batches in a day; youngest batch becomes that day's "canon"

ALTER TABLE simulation_batches ALTER COLUMN batch_id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE simulation_batches DROP CONSTRAINT simulation_batches_as_of_date_season_key;