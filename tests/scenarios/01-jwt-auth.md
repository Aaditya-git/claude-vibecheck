# Scenario 01: JWT Auth Middleware

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Add JWT authentication middleware to my Express app"

## What Claude writes

~35 lines of middleware that:
- Extracts Bearer token from Authorization header
- Verifies signature with `jwt.verify()`
- Returns 401 if missing, invalid, or expired (no refresh)
- Calls `next()` on valid token

## Expected vibecheck narration

Should cover:
1. What it does: validates token before route handlers run
2. Non-obvious: expired tokens → 401, no refresh (silent behavior)
3. Why it matters: if client expects silent renewal, requests silently fail

## Pass criteria

vibecheck fires. Narration mentions token expiry behavior. Does NOT just say "this validates the JWT token."
