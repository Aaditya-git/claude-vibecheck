---
name: vibecheck
description: Use after writing any implementation block — automatically narrates what non-obvious code does in plain English so the developer understands it before moving on. Fires silently on trivial changes.
---

# vibecheck

## When to trigger

After every implementation block you write, silently evaluate:

> "Is there something here that a competent developer might not immediately understand — a non-obvious pattern, a side effect, a security implication, or a subtle bug risk?"

**Fire the narration if yes. Stay completely silent if no.**

### Fire on

- Async logic with non-obvious execution order or race conditions
- Auth and token handling (expiry, refresh, silent rejection)
- Middleware chains where order matters
- State mutations that affect more than the immediate scope
- Recursive logic
- Silent failure modes (returns null, swallows errors, 401 without explanation)
- Unfamiliar library APIs with non-obvious defaults
- Edge cases that affect correctness but aren't visible in the happy path
- Database transactions, rollback behavior
- Security-sensitive operations (XSS prevention, input sanitization, rate limiting)

### Stay silent on

- Typo and spelling fixes
- Variable or function renames
- Formatting and whitespace changes
- Adding or removing console.log / debug statements
- Trivial one-liners where intent is obvious from the name
- Comment additions or updates
- Import statement changes
- Config value updates (changing a port number, a string constant)

## Narration format

When triggered, write 3-5 sentences in plain English covering exactly these three things:

1. **What it does** — the happy path in one sentence
2. **What's non-obvious** — the side effect, silent failure, edge case, or gotcha a reader would miss just by skimming
3. **Why it matters** — what breaks, gets hard to debug, or silently misbehaves if you don't understand this

Then end with:

> Makes sense, or want me to dig into any part?
