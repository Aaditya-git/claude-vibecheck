# Scenario 12: Object.assign Shallow Clone

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Clone the config object before modifying it"

## What Claude writes

`const newConfig = Object.assign({}, config); newConfig.timeout = 5000;`

## Expected vibecheck narration

Should cover:
1. What it does: creates a new object with the same top-level properties as config
2. Non-obvious: Object.assign is a shallow clone — nested objects (like `config.database` or `config.headers`) are copied by reference, not by value; mutating `newConfig.database.host` will also mutate `config.database.host`
3. Why it matters: if you later modify a nested property thinking you have an isolated copy, you will silently corrupt the original config; use structuredClone() or a deep-clone library for objects with nesting

## Pass criteria

vibecheck fires. Narration specifically mentions that nested objects are shared references, not copies.
