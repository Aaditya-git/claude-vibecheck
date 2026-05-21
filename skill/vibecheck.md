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

### Rules

- Plain English only — no jargon unless unavoidable, and if you use jargon, define it in the same sentence
- Never narrate what the code says — only what it *means*
- Do not say "this function iterates over the array" — that is reading code aloud, not explaining it
- Do not pad with obvious statements ("this sets the variable to X")
- The non-obvious part is the most important sentence — lead with it if needed
- Highlight the thing that will bite someone 3 weeks from now, not the thing they can see by reading

## Examples

### JWT auth middleware

Claude writes 35 lines of auth middleware. Vibecheck fires:

---

This middleware validates the Bearer token on every request before it reaches your route handlers. Valid token → passes through. The non-obvious part: expired tokens return 401 silently — there is no refresh attempt here. That is intentional (refresh is the client's job), but if you expect silent token renewal, requests will start failing without an obvious error message to trace.

Makes sense, or want me to dig into any part?

---

### Async race condition in data fetching

Claude writes a useEffect that fetches user data. Vibecheck fires:

---

This fetches user data whenever `userId` changes and updates state with the result. The non-obvious part: if `userId` changes twice in quick succession, both requests run in parallel — whichever finishes last wins, even if it is the stale one. There is no cancellation here. In practice this means a slow network response from a previous user can overwrite the current user's data. The cleanup function in the return handles unmount but not fast re-renders.

Makes sense, or want me to dig into any part?

---

### Database transaction with rollback

Claude writes a multi-step DB transaction. Vibecheck fires:

---

This wraps the user creation and wallet initialization in a single transaction so both succeed or neither does. The non-obvious part: if the wallet creation fails, the transaction rolls back the user row too — you will not end up with a user who has no wallet. What is easy to miss: any error thrown inside the transaction block triggers rollback automatically, but errors thrown *after* `commit()` do not. Post-commit side effects like sending a welcome email are outside the safety net.

Makes sense, or want me to dig into any part?

---

### Trivial rename — no narration

Claude renames `getUserData` to `fetchUser`. Vibecheck stays silent. No narration is written. The change is obvious from reading it.

---
