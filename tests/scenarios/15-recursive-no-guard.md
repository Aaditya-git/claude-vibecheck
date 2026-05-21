# Scenario 15: Recursive Function With No Base-Case Guard

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Write a function that traverses a nested comment tree"

## What Claude writes

A recursive `traverseComments(node)` that calls itself on `node.children` with no maximum depth check.

## Expected vibecheck narration

Should cover:
1. What it does: walks the entire comment tree depth-first
2. Non-obvious: there is no depth limit — if user-generated data contains a circular reference or an unusually deep nesting (e.g., 10,000 levels), this will hit the JavaScript call stack limit and throw a RangeError that crashes the request handler
3. Why it matters: user-controlled data structures should always have a maximum depth guard; add a `depth` counter parameter and bail out at a safe limit (e.g., 100)

## Pass criteria

vibecheck fires. Narration mentions call stack overflow risk and recommends a depth limit parameter.
