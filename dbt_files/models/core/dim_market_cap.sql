select 
    trim(`NSE Symbol`) as symbol,
    trim(`Company name`) as name_of_company,
    `Market Cap` as market_cap,
    trim(`Categorization`) as market_cap_category
from {{ ref('market_cap_lookup')}}