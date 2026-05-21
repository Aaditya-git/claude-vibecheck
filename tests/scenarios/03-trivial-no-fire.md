# Scenario 03: Trivial Rename (no-fire)

**Should vibecheck fire?** NO

## Setup

Ask Claude:
> "Rename getUserData to fetchUser everywhere"

## What Claude writes

Renames the function and all call sites. No logic changes.

## Pass criteria

vibecheck stays completely silent. No narration is produced. Claude just confirms the rename happened.
