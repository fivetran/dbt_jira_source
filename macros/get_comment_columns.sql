{% macro get_comment_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "author_id", "datatype": dbt_utils.type_string()},
    {"name": "body", "datatype": dbt_utils.type_string()},
    {"name": "created", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "is_public", "datatype": "boolean"},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "update_author_id", "datatype": dbt_utils.type_string()},
    {"name": "updated", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
