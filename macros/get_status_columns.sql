{% macro get_status_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "description", "datatype": dbt_utils.type_string(), "alias": "status_description"},
    {"name": "id", "datatype": dbt_utils.type_int(), "alias": "status_id"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias": "status_name"},
    {"name": "status_category_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
