# Scenario 02: Async Race Condition

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Fetch user data when userId changes in a React component"

## What Claude writes

useEffect that fetches user data on userId change, sets state with result, no cleanup/cancellation.

## Expected vibecheck narration

Should cover:
1. What it does: fetches on userId change, updates state
2. Non-obvious: stale response from previous userId can overwrite current data if requests overlap
3. Why it matters: intermittent wrong-user data displayed, hard to reproduce

## Pass criteria

vibecheck fires. Narration mentions the race condition / stale response problem.
