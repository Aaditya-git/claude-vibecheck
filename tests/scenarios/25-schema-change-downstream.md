# Scenario 25: Column Rename Breaks Downstream Models

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Rename the 'amt' column to 'amount' in the orders staging model"

## What Claude writes

Renames the column in `stg_orders.sql` only.

## Expected vibecheck narration

Should cover:
1. What it does: renames `amt` to `amount` in the staging model
2. Non-obvious: any downstream dbt model, SQL query, BI dashboard, or Python script that references `amt` will silently break — dbt will compile successfully (column references aren't validated at compile time) but fail at runtime when the column isn't found
3. Why it matters: before renaming, search the entire codebase and BI layer for `amt` references; in dbt, run `dbt ls --select +stg_orders` to find all downstream dependents that need updating in the same PR

## Pass criteria

vibecheck fires. Narration mentions silent downstream breakage and recommends checking all consumers before renaming.
