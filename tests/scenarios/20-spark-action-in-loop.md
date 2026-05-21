# Scenario 20: Spark Action Inside a Loop

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "For each store in the stores list, count how many orders it has"

## What Claude writes

```python
for store_id in store_ids:
    count = orders_df.filter(col('store_id') == store_id).count()
    results[store_id] = count
```

## Expected vibecheck narration

Should cover:
1. What it does: counts orders for each store by filtering and calling .count()
2. Non-obvious: `.count()` is a Spark action — it triggers a full job execution on the cluster for every iteration of the loop; with 500 stores this submits 500 separate Spark jobs
3. Why it matters: replace with a single aggregation: `orders_df.groupBy('store_id').count()` — this runs one job across the whole dataset and is orders of magnitude faster

## Pass criteria

vibecheck fires. Narration identifies .count() as a Spark action and recommends a single groupBy aggregation.
