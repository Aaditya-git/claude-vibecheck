# Scenario 24: Timezone-Naive Datetime in a Pipeline

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Filter orders created in the last 24 hours"

## What Claude writes

```python
cutoff = datetime.now() - timedelta(hours=24)
recent_orders = orders_df[orders_df['created_at'] > cutoff]
```

## Expected vibecheck narration

Should cover:
1. What it does: computes a cutoff 24 hours ago and filters orders newer than that
2. Non-obvious: `datetime.now()` returns a timezone-naive datetime using the local system clock; if `created_at` is stored in UTC (which is standard in most databases and data warehouses), the comparison will be off by however many hours the server's timezone differs from UTC
3. Why it matters: use `datetime.now(timezone.utc)` and ensure `created_at` is also timezone-aware; a pipeline running on a server in EST will silently miss 5 hours of orders compared to one running in UTC

## Pass criteria

vibecheck fires. Narration mentions timezone-naive datetime and the UTC comparison mismatch.
