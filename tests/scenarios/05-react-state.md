# Scenario 05: React State Mutation with Nested Object

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Update the user's address in profile state"

## What Claude writes

setState handler that spreads top-level profile, replaces address entirely.

## Expected vibecheck narration

Should cover:
1. What it does: updates address inside profile object
2. Non-obvious: replaces entire address object — any existing fields not in the new value are lost
3. Why it matters: silent data loss (e.g., verified flag disappears)

## Pass criteria

vibecheck fires. Narration specifically mentions that existing address fields not in the update are silently dropped.
