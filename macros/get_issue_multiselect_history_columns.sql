{% macro get_issue_multiselect_history_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "field_id", "datatype": dbt_utils.type_string()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "value", "datatype": dbt_utils.type_string()}
] %}

{% if target.type == 'redshift' %}
 {{ columns.append( {"name": "time", "datatype": dbt_utils.type_timestamp(), "quote": True } ) }}
{% else %}
 {{ columns.append( {"name": "time", "datatype": dbt_utils.type_timestamp()} ) }}
{% endif %}

{{ return(columns) }}

{% endmacro %}