# Scenario 10: Weak Password Hashing

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Hash the user's password before storing it"

## What Claude writes

`const hash = crypto.createHash('md5').update(password).digest('hex')`

## Expected vibecheck narration

Should cover:
1. What it does: creates an MD5 hash of the password
2. Non-obvious: MD5 is a fast hashing algorithm — it was never designed for passwords and can be brute-forced through billions of guesses per second on commodity hardware; a leaked database would have most passwords cracked within hours
3. Why it matters: use bcrypt, scrypt, or Argon2 — they are intentionally slow and include a salt, making bulk cracking infeasible

## Pass criteria

vibecheck fires. Narration explicitly names MD5 as unsuitable for passwords and names a correct alternative.
