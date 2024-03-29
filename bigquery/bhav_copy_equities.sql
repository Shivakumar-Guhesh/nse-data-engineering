CREATE OR REPLACE EXTERNAL TABLE `nse-data-engineering.nse_data_all_dataset.bhav_copy_equities`
OPTIONS (
  format = 'parquet',
  uris = ['gs://nse_data_gcs_bucket/bhav_copy_equities/*/daily_equity.parquet']
);