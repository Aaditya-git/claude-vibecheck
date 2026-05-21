# Scenario 13: CORS Wildcard Configuration

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Enable CORS for the API server"

## What Claude writes

`app.use(cors({ origin: '*' }))`

## Expected vibecheck narration

Should cover:
1. What it does: allows any website on the internet to make requests to this API from a browser
2. Non-obvious: `origin: '*'` also means you cannot use `credentials: true` — cookies and Authorization headers will be blocked by the browser; and for any authenticated API, allowing all origins means any malicious site can make requests on behalf of your logged-in users
3. Why it matters: either lock origin to your actual frontend domains, or if you genuinely need public API access, understand that credentials won't work with wildcard

## Pass criteria

vibecheck fires. Narration mentions the credentials incompatibility and the open-access implication.
