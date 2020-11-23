{% macro get_issue_type_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int(), "alias": "issue_type_id"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias": "issue_type_name"},
    {"name": "subtask", "datatype": "boolean", "alias": "is_subtask"}
] %}

{{ return(columns) }}

{% endmacro %}
