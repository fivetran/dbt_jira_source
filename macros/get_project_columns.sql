{% macro get_project_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "description", "datatype": dbt_utils.type_string(), "alias": "project_description"},
    {"name": "id", "datatype": dbt_utils.type_int(), "alias": "project_id"},
    {"name": "key", "datatype": dbt_utils.type_string(), "alias": "project_key"},
    {"name": "lead_id", "datatype": dbt_utils.type_string(), "alias": "project_lead_user_id"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias": "project_name"},
    {"name": "permission_scheme_id", "datatype": dbt_utils.type_int()},
    {"name": "project_category_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
