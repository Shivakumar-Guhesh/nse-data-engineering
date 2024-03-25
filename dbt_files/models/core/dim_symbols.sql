select 
    `SYMBOL` as symbol,
    `NAME OF COMPANY` as name_of_company,
    ` SERIES` as series,
    ` DATE OF LISTING` as date_of_listing,
    ` PAID UP VALUE` as paid_up_value,
    ` FACE VALUE` as face_value
from {{ ref('equity_symbols_lookup')}}