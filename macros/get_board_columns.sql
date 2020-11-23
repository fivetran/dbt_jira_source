{% macro get_board_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int(), "alias": "board_id"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias": "board_name"},
    {"name": "type", "datatype": dbt_utils.type_string(), "alias": "board_type"}
] %}

{{ return(columns) }}

{% endmacro %}
