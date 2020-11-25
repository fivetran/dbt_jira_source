{% macro get_field_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "is_array", "datatype": "boolean"},
    {"name": "is_custom", "datatype": "boolean"},
    {"name": "name", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}