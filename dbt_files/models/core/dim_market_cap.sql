select 
    `NSE Symbol` as symbol,
    `Company name` as name_of_company,
    `Market Cap` as market_cap,
    `Categorization` as market_cap_category
from {{ ref('market_cap_lookup')}}