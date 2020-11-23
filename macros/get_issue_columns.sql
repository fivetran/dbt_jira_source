{% macro get_issue_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "_original_estimate", "datatype": dbt_utils.type_float()},
    {"name": "_remaining_estimate", "datatype": dbt_utils.type_float()},
    {"name": "_time_spent", "datatype": dbt_utils.type_float()},
    {"name": "assignee", "datatype": dbt_utils.type_string(), "alias": "assignee_user_id"},
    {"name": "created", "datatype": dbt_utils.type_timestamp(), "alias": "created_at"},
    {"name": "creator", "datatype": dbt_utils.type_string(), "alias": "creator_user_id"},
    {"name": "description", "datatype": dbt_utils.type_string(), "alias": "issue_description"},
    {"name": "due_date", "datatype": "date"},
    {"name": "environment", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int(), "alias": "issue_id"},
    {"name": "issue_type", "datatype": dbt_utils.type_int(), "alias": "issue_type_id"},
    {"name": "key", "datatype": dbt_utils.type_string(), "alias": "issue_key"},

    {"name": "original_estimate", "datatype": dbt_utils.type_float()},
    {"name": "parent_id", "datatype": dbt_utils.type_int(), "alias": "parent_issue_id"},
    {"name": "priority", "datatype": dbt_utils.type_int(), "alias": "priority_id"},
    {"name": "project", "datatype": dbt_utils.type_int(), "alias": "project_id"},
    {"name": "remaining_estimate", "datatype": dbt_utils.type_float()},
    {"name": "reporter", "datatype": dbt_utils.type_string(), "alias": "reporter_user_id"},
    {"name": "resolution", "datatype": dbt_utils.type_int(), "alias": "resolution_id"},
    {"name": "resolved", "datatype": dbt_utils.type_timestamp(), "alias": "resolved_at"},
    {"name": "status", "datatype": dbt_utils.type_int(), "alias": "status_id"},
    {"name": "status_category_changed", "datatype": dbt_utils.type_timestamp(), "alias": "status_changed_at"},
    {"name": "summary", "datatype": dbt_utils.type_string(), "alias": "issue_name"},
    {"name": "time_spent", "datatype": dbt_utils.type_float()},
    {"name": "updated", "datatype": dbt_utils.type_timestamp(), "alias": "updated_at"},
    {"name": "work_ratio", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
