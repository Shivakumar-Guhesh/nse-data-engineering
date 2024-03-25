{{ 
  config(
    materialized = 'table',
    incremental_strategy = 'insert_overwrite',
    partition_by = { 
      'field': 'timestamp',
      'data_type': 'timestamp',
      'granularity': 'day' 
    }
  ) 
}} 

with equity_data as (
    select *, 
        'Equity' as instrument_type
    from {{ ref('stg_bhav_copy_equities') }}
), 

dim_symbols as (
    select * from {{ ref('dim_symbols') }}
    where series = 'EQ'
)

select equity_data.*,dim_symbols.name_of_company,dim_symbols.date_of_listing,dim_symbols.face_value

from equity_data
inner join dim_symbols
on equity_data.symbol = dim_symbols.symbol