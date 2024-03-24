-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `nse-data-engineering.nse_data_all_dataset.bhav_copy_indices`
OPTIONS (
  format = 'parquet',
  uris = ['gs://nse_data_gcs_bucket/bhav_copy_indices/*/daily_index.parquet']
);


CREATE OR REPLACE EXTERNAL TABLE `nse-data-engineering.nse_data_all_dataset.bhav_copy_equities`
OPTIONS (
  format = 'parquet',
  uris = ['gs://nse_data_gcs_bucket/bhav_copy_equities/*/daily_equity.parquet']
);

-- Query to get Table ddl for a particular schema
-- Replace  `nse-data-engineering.nse_data_all_dataset` with your project id.dataset
SELECT
  table_name, ddl
FROM
  nse-data-engineering.nse_data_all_dataset.INFORMATION_SCHEMA.TABLES;


-- DDL for table bhav_copy_indices
CREATE TABLE `nse-data-engineering.nse_data_all_dataset.bhav_copy_indices`
(
  index_name STRING,
  index_date DATETIME,
  open_index_value FLOAT64,
  high_index_value FLOAT64,
  low_index_value FLOAT64,
  closing_index_value FLOAT64,
  points_change FLOAT64,
  change_pct FLOAT64,
  volume INT64,
  turnover_rs_cr STRING,
  p_e STRING,
  p_b STRING,
  div_yield STRING
) PARTITION BY
  DATE(index_date);

-- DDL for table bhav_copy_equities
CREATE TABLE `nse-data-engineering.nse_data_all_dataset.bhav_copy_equities`
(
  symbol STRING,
  series STRING,
  open FLOAT64,
  high FLOAT64,
  low FLOAT64,
  close FLOAT64,
  last FLOAT64,
  prevclose FLOAT64,
  tottrdqty INT64,
  tottrdval FLOAT64,
  timestamp DATETIME,
  totaltrades INT64
) PARTITION BY
  DATE(timestamp);