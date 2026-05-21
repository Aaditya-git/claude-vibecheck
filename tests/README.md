# Manual Tests

vibecheck is a skill — there are no unit tests. Tests are manual scenarios that verify the skill fires (or stays silent) in the right situations.

## How to run

1. Install vibecheck (see [INSTALL.md](../INSTALL.md))
2. Open Claude Code in any project
3. Run the scenario from `tests/scenarios/`
4. Check: did vibecheck fire? Did it say the right thing?

## Scenarios

| File | Should fire? | Tests |
|------|-------------|-------|
| `01-jwt-auth.md` | YES | Token expiry silent behavior |
| `02-async-race.md` | YES | Stale response race condition |
| `03-trivial-no-fire.md` | NO | Rename stays silent |
| `04-db-transaction.md` | YES | Post-commit safety net boundary |
| `05-react-state.md` | YES | Silent field loss on nested update |

## Adding scenarios

Create `tests/scenarios/NN-name.md` following the existing format:
- Should fire? (YES/NO)
- Setup: what to ask Claude
- What Claude writes
- Expected narration (for YES scenarios)
- Pass criteria
