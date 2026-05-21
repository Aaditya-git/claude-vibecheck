---
name: vibecheck
description: Use after writing any implementation block — automatically narrates what non-obvious code does in plain English so the developer understands it before moving on. Fires silently on trivial changes.
---

# vibecheck

## When to trigger

After every implementation block you write, silently evaluate:

> "Is there something here that a competent developer might not immediately understand — a non-obvious pattern, a side effect, a security implication, or a subtle bug risk?"

**Fire the narration if yes. Stay completely silent if no.**
