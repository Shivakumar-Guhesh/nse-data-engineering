# BigQuery


Google BigQuery is used as data-warehouse for this project.

Source tables are created as external tables (the data is not stored inside Google BigQuery, but instead references the data from Google Cloud Storage)

After source data is loaded, DBT is used to create stage table and fact/dim tables.

Fact tables are partitioned by `timestamp` field from DBT for efficiency.

(LookerStudio Report is primarily used to answer queries for a particular day)
