# DBT

DBT is used for data modelling, applying transforms and create partitioned tables in data warehouse

## Models:

### Staging

- stg_bhav_copy_equities
  - Staging table for daily bhav_copy data for equities segment in NSE

- stg_bhav_copy_indices 
  - Staging table for daily bhav_copy data for indices  segment in NSE

### Core
- dim_symbols
  - Dimension table containing information about equity-symbols

- fact_equity
  - Fact table for daily equities bhav_copy data in NSE
  - Partitioned by `timestamp` column to enhance querying

*Note: Detailed documentation is available in dbt documentation*

## Transformations:

  Creating additional columns for doing technical analysis

- get_moving_average

  - Return moving averages, which is used for creating columns ma_50 and ma_200.

- change_in_price

  - Returns difference between a symbol's closing price on a trading day and its closing price on the previous trading day

- pct_chg_price
  - Percentage difference between a security's closing price on a 
  trading day and its closing price on the previous trading day

## Jobs:

- Deploy job to load data into prod_schema : *Runs daily at 13:30:00 UTC*

- CI job : Checks and merge PR automatically after comparing changes with production
