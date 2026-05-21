# Scenario 21: SQL Aggregation Silently Ignores NULLs

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Calculate the average order value per customer"

## What Claude writes

```sql
SELECT customer_id, AVG(order_value) as avg_order_value
FROM orders
GROUP BY customer_id
```

## Expected vibecheck narration

Should cover:
1. What it does: calculates the average order value grouped by customer
2. Non-obvious: AVG() silently ignores NULL values — a customer with 3 orders worth $100, $200, and NULL gets an average of $150, not $100; COUNT(*) and COUNT(order_value) will also give different results for the same reason
3. Why it matters: if NULLs represent missing data (e.g., refunded orders, data pipeline gaps), your averages are silently inflated; decide explicitly whether NULLs should be treated as zero with COALESCE(order_value, 0) or excluded, and document the choice

## Pass criteria

vibecheck fires. Narration mentions that AVG silently excludes NULLs and the impact on metric accuracy.
