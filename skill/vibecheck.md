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
