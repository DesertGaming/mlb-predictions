-- Pulls the canon batch_id for a given day

SELECT batch_id FROM simulation_batches
WHERE as_of_date = %s AND season = %s
ORDER BY created_at DESC LIMIT 1;