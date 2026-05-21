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
| `06-promise-all.md` | YES | Single rejection kills all parallel fetches |
| `07-event-listener-leak.md` | YES | Stacking listeners on remount |
| `08-swallowed-error.md` | YES | Silent execution after payment failure |
| `09-sql-injection.md` | YES | User input interpolated into SQL |
| `10-weak-password-hash.md` | YES | MD5 not suitable for passwords |
| `11-interval-leak.md` | YES | setInterval stacks on remount |
| `12-shallow-clone.md` | YES | Nested objects shared by reference |
| `13-cors-wildcard.md` | YES | Wildcard blocks credentials |
| `14-env-var-no-fallback.md` | YES | undefined on missing env var |
| `15-recursive-no-guard.md` | YES | Call stack overflow on deep trees |
| `16-no-fire-type-annotation.md` | NO | Type annotation is metadata only |
| `17-no-fire-string-constant.md` | NO | String value change is obvious |
| `18-pandas-chained-indexing.md` | YES | Silent no-op on chained assignment |
| `19-dbt-full-refresh.md` | YES | Missing is_incremental guard |
| `20-spark-action-in-loop.md` | YES | N Spark jobs instead of one groupBy |
| `21-sql-null-aggregation.md` | YES | AVG silently skips NULLs |
| `22-airflow-no-retry.md` | YES | Zero retries on transient failures |
| `23-window-no-order.md` | YES | Non-deterministic row numbering |
| `24-timezone-naive-datetime.md` | YES | UTC mismatch on naive datetime |
| `25-schema-change-downstream.md` | YES | Column rename breaks all consumers |

## Adding scenarios

Create `tests/scenarios/NN-name.md` following the existing format:
- Should fire? (YES/NO)
- Setup: what to ask Claude
- What Claude writes
- Expected narration (for YES scenarios)
- Pass criteria
