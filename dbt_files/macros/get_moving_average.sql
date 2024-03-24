{#
    This macro returns the moving average for number of days given for the specified column
#}

{% macro get_moving_average(num_days,col,date_col,inp_symbol) -%}

    AVG({{col}}) OVER (PARTITION BY {{inp_symbol}} ORDER BY {{date_col}} ROWS BETWEEN {{num_days}} PRECEDING AND CURRENT ROW )

{%- endmacro %}