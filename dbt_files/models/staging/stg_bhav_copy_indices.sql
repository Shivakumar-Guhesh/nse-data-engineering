{{ 
  config(
  materialized = 'view',
  incremental_strategy = 'insert_overwrite',
  partition_by = { 
      'field': 'index_date',
      'data_type': 'timestamp',
      'granularity': 'day' 
    }
  ) 
}} 

with source as (
  select
    *,
    row_number() over(partition by index_name, index_date) as rn
  from
    {{ source('staging', 'bhav_copy_indices') }}
)
select
  {{ dbt_utils.generate_surrogate_key(["index_name", "index_date"]) }} as index_id,
  index_name,
  index_date,
  open_index_value,
  high_index_value,
  low_index_value,
  closing_index_value,
  points_change,
  change_pct,
  volume,
  turnover_rs_cr,
  p_e,
  p_b,
  div_yield,
  {{ get_moving_average(
    50,
    "closing_index_value",
    "index_date",
    "index_name"
  ) }} as ma_50,
  {{ get_moving_average(
    200,
    "closing_index_value",
    "index_date",
    "index_name"
  ) }} as ma_200
from
  source
where
  rn = 1