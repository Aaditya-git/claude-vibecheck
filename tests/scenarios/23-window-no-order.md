# Scenario 23: Window Function With No ORDER BY

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Add a row number to rank customers by their signup date within each region"

## What Claude writes

```sql
SELECT *, ROW_NUMBER() OVER (PARTITION BY region) as row_num
FROM customers
```

## Expected vibecheck narration

Should cover:
1. What it does: assigns a row number to each customer within their region
2. Non-obvious: without ORDER BY inside the OVER clause, the row numbers are assigned in arbitrary order — the database is free to assign 1 to any row in the partition; results will appear consistent in testing but change unpredictably as the table grows or query plans change
3. Why it matters: add `ORDER BY signup_date` inside the OVER clause to get deterministic ranking; non-deterministic window functions are a frequent source of "flaky" reports that produce different results on re-run

## Pass criteria

vibecheck fires. Narration mentions non-deterministic ordering and the need for ORDER BY inside OVER.
