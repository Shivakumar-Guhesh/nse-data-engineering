select 
    trim(`Ticker`) as symbol,
    trim(`Description`) as name_of_company,
    trim(`Sector`) as sector,
    trim(`Industry`) as industry
from {{ ref('sector_lookup')}}