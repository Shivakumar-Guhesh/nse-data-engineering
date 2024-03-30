select 
    `Ticker` as symbol,
    `Description` as name_of_company,
    `Sector` as sector,
    `Industry` as industry
from {{ ref('sector_lookup')}}