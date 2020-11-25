{% macro get_issue_link_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "related_issue_id", "datatype": dbt_utils.type_int()},
    {"name": "relationship", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}