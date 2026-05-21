# Scenario 07: Event Listener Without Cleanup

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Listen for window resize events to update a layout variable in a React component"

## What Claude writes

`useEffect` that calls `window.addEventListener('resize', handler)` with no cleanup return function.

## Expected vibecheck narration

Should cover:
1. What it does: registers a resize listener when the component mounts
2. Non-obvious: without a cleanup function returning `window.removeEventListener`, the listener stays registered after the component unmounts — every remount adds another listener on top
3. Why it matters: after navigating away and back several times, you'll have dozens of stale listeners firing on every resize event, each one trying to update state on an unmounted component

## Pass criteria

vibecheck fires. Narration mentions stacking listeners on remount and the missing removeEventListener cleanup.
