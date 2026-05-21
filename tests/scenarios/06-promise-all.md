# Scenario 06: Promise.all Failure Behavior

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Fetch user profile, preferences, and notifications in parallel"

## What Claude writes

`Promise.all([fetchProfile(), fetchPreferences(), fetchNotifications()])` with a single `.catch()`.

## Expected vibecheck narration

Should cover:
1. What it does: runs all three fetches in parallel and waits for all to complete
2. Non-obvious: if ANY one of the three rejects, Promise.all rejects immediately — the other two requests are still running in the background but their results are discarded silently
3. Why it matters: a non-critical notifications failure will blow up the entire page load; use Promise.allSettled if you want partial success

## Pass criteria

vibecheck fires. Narration mentions that one failure kills everything and suggests Promise.allSettled for partial-success scenarios.
