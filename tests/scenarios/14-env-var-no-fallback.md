# Scenario 14: Environment Variable With No Fallback

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Connect to the database using the connection string from environment variables"

## What Claude writes

`const client = new Client({ connectionString: process.env.DATABASE_URL })`

## Expected vibecheck narration

Should cover:
1. What it does: reads the database connection string from the DATABASE_URL environment variable
2. Non-obvious: if DATABASE_URL is not set, `process.env.DATABASE_URL` is `undefined` — the Client constructor may accept it silently, fail with a confusing error at connection time, or throw immediately depending on the library
3. Why it matters: missing environment variables are a top cause of "works on my machine" failures in CI and production; validate early with `if (!process.env.DATABASE_URL) throw new Error('DATABASE_URL is required')` so the failure is obvious and immediate

## Pass criteria

vibecheck fires. Narration mentions undefined behavior when the variable is missing and recommends early validation.
