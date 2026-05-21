# Scenario 04: Database Transaction

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Create a user and initialize their wallet in a single transaction"

## What Claude writes

SQL/ORM transaction that creates user row, creates wallet row, commits both or rolls back both on error.

## Expected vibecheck narration

Should cover:
1. What it does: atomic create — both succeed or neither does
2. Non-obvious: rollback is automatic on any thrown error inside the block, but post-commit operations (email, analytics) are NOT protected
3. Why it matters: side effects after commit() are outside the safety net

## Pass criteria

vibecheck fires. Narration mentions what's inside vs outside the transaction safety net.
