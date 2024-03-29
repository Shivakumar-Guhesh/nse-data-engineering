# BigQuery


Google BigQuery is used as data-warehouse for this project.

After data is loaded into GCS via mage pipelines, (1 successful run for each pipeline should be enough)

Exeute statements in the files [bhav_copy_indices](./bigquery/bhav_copy_equities.sql)
and [bhav_copy_indices](./bigquery/bhav_copy_indices.sql) in bigquery
