-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `nse-data-engineering.nse_data_all_dataset.bhav_copy_indices`
OPTIONS (
  format = 'parquet',
  uris = ['gs://nse_data_gcs_bucket/bhav_copy_indices/*/daily_index.parquet']
);