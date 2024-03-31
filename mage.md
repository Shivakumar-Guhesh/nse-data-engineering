# Mage

For this project, mage is used as ETL orchestrator.

We have two pipelines which are built locally and deployed in cloud

## Pipelines

- `nse_equity_bhavcopy`

    - Extracts daily equity data from source, transforms it, and loads the data into GCS

    - Data Loader `load_daily_equity_data`
    - Transformer `transform_equity`
    - Data Exporter `export_daily_equity_gcs` 

- `nse_index_bhavcopy`

    - Extracts daily index data from source, transforms it, and loads the data into GCS

    - Data Loader `load_daily_index_data`
    - Transformer `transform_index`
    - Data Exporter `export_daily_index_gcs` 

  Transformations applied: 

    -  Assign appropriate data types 
    
    - Standardize columns names into camel_case

## Schedule

  `equity_daily_run` *Runs daily at 13:30:00 UTC*

  `index_daily_run` *Runs daily at 13:30:00 UTC*

  These pipelines were also used to load bulk past data via mage - backfills 



Documentation: https://github.com/mage-ai/mage-ai 