# Scenario 22: Airflow Task With No Retry Policy

**Should vibecheck fire?** YES

## Setup

Ask Claude:
> "Create an Airflow task to load data from S3 into the warehouse"

## What Claude writes

A PythonOperator or similar with no `retries` or `retry_delay` parameters.

## Expected vibecheck narration

Should cover:
1. What it does: defines a task that loads data from S3 to the warehouse
2. Non-obvious: without `retries=3, retry_delay=timedelta(minutes=5)`, a single transient network hiccup or S3 throttle will fail the entire DAG run permanently; Airflow defaults to zero retries
3. Why it matters: data pipelines run in environments with occasional transient failures; always set at least 2-3 retries with exponential backoff for network-dependent tasks, and set `retry_exponential_backoff=True` for tasks hitting external APIs

## Pass criteria

vibecheck fires. Narration mentions zero-retry default and recommends explicit retry configuration.
