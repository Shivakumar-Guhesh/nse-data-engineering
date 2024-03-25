{{ 
  config(
    materialized = 'view',
    incremental_strategy = 'insert_overwrite',
    partition_by = { 
      'field': 'timestamp',
      'data_type': 'timestamp',
      'granularity': 'day' 
    }
  ) 
}} 

with source as (
  select *,
    row_number() over(partition by symbol, timestamp) as rn
  from
    {{ source('staging', 'bhav_copy_equities') }}
)
select
  {{ dbt_utils.generate_surrogate_key(["symbol", "timestamp"]) }} as equity_id,
  symbol,
  series,
  open,
  high,
  low,
  close,
  last,
  prevclose,
  tottrdqty,
  tottrdval,
  timestamp,
  totaltrades,
  {{ get_moving_average(50, "close", "timestamp", "symbol") }} as ma_50,
  {{ get_moving_average(200, "close", "timestamp", "symbol") }} as ma_200,
  {{ change_in_price() }} as change_in_close_price,
  {{ pct_chg_price() }} as pct_change_in_close_price
from 
  source
where
  rn = 1