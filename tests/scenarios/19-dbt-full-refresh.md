# Scenario 19: dbt Incremental Model Without is_incremental Guard

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Write a dbt incremental model for daily order events"

## What Claude writes

A dbt model with `materialized='incremental'` but no `{% if is_incremental() %}` filter on the WHERE clause.

## Expected vibecheck narration

Should cover:
1. What it does: materializes as an incremental table, appending new rows on each run
2. Non-obvious: without the `is_incremental()` guard filtering to only new records, every run scans and inserts the full source table — on a `--full-refresh` this doubles every row in the target if there's no deduplication key
3. Why it matters: add `{% if is_incremental() %} WHERE event_date > (SELECT MAX(event_date) FROM {{ this }}) {% endif %}` to limit each run to genuinely new data; otherwise your incremental model behaves like a full table scan every time

## Pass criteria

vibecheck fires. Narration mentions the missing is_incremental guard and the duplicate-row risk on full refresh.
