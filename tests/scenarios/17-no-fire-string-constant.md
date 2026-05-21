# Scenario 17: Updating a String Constant (no-fire)

**Should vibecheck fire?** NO

## Setup

Ask Claude:
> "Change the welcome message from 'Hello' to 'Welcome back'"

## What Claude writes

Changes `const WELCOME_MESSAGE = 'Hello'` to `const WELCOME_MESSAGE = 'Welcome back'`. No logic changes.

## Pass criteria

vibecheck stays completely silent. Changing a string value is obvious from reading the diff.
