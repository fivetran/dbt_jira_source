{% macro get_field_option_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}