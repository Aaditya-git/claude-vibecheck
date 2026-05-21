# Scenario 11: setInterval Without Cleanup

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Poll the server for new messages every 5 seconds in a React component"

## What Claude writes

`useEffect` that calls `setInterval(fetchMessages, 5000)` with no return cleanup.

## Expected vibecheck narration

Should cover:
1. What it does: starts polling every 5 seconds when the component mounts
2. Non-obvious: without `return () => clearInterval(id)` in the cleanup, the interval keeps firing after the component unmounts; every remount adds a new interval on top of the existing ones
3. Why it matters: a user who navigates away and back 10 times now has 10 concurrent polling loops hammering your server, each updating state on components that no longer exist

## Pass criteria

vibecheck fires. Narration mentions stacking intervals and missing clearInterval cleanup.
