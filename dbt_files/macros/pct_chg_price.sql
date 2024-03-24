{#
    This macro returns the percentage change in price between close price and previous day's close
#}

{% macro pct_chg_price() -%}

    ((close - prevclose)/prevclose) * 100

{%- endmacro %}