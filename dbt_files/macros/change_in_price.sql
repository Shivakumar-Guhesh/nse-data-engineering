{#
    This macro returns the change in price between close price and previous day's close
#}

{% macro change_in_price() -%}

    close - prevclose

{%- endmacro %}