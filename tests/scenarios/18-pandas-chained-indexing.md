# Scenario 18: Pandas Chained Indexing

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Filter the orders DataFrame to active orders, then set their status to 'processing'"

## What Claude writes

```python
df[df['status'] == 'active']['status'] = 'processing'
```

## Expected vibecheck narration

Should cover:
1. What it does: filters rows where status is 'active' and attempts to set their status to 'processing'
2. Non-obvious: this is chained indexing — Pandas may operate on a copy of the filtered DataFrame rather than the original; the assignment silently does nothing, no error is raised, and `df` is unchanged
3. Why it matters: use `.loc` instead: `df.loc[df['status'] == 'active', 'status'] = 'processing'` — this guarantees the mutation happens on the original DataFrame

## Pass criteria

vibecheck fires. Narration mentions the silent no-op risk and recommends `.loc` syntax.
