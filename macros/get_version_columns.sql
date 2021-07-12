{% macro get_version_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "archived", "datatype": "boolean"},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "overdue", "datatype": "boolean"},
    {"name": "project_id", "datatype": dbt_utils.type_int()},
    {"name": "release_date", "datatype": "date"},
    {"name": "released", "datatype": "boolean"},
    {"name": "start_date", "datatype": "date"}
] %}

{{ return(columns) }}

{% endmacro %}
