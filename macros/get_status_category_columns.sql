{% macro get_status_category_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "_fivetran_deleted", "datatype": "boolean"}
] %}

{{ return(columns) }}

{% endmacro %}
