# Scenario 16: Adding a TypeScript Type Annotation (no-fire)

**Should vibecheck fire?** NO

## Setup

Ask Claude:
> "Add a return type annotation to the getUser function"

## What Claude writes

Changes `function getUser(id)` to `function getUser(id: string): Promise<User>`. No logic changes.

## Pass criteria

vibecheck stays completely silent. A type annotation is metadata — it changes nothing about runtime behavior.
