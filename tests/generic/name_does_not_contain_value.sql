{% test name_does_not_contain_value(model, column_name, value) %}

select 
    * 
from {{ model }}
where 
    {{ column_name }} = '{{ value }}'

{% endtest %}