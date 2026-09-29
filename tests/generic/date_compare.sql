{% test date_compare(model, column_name, date2) %}

select
    {{ column_name }} as date_1,
    {{ date2 }} as date_2
from {{ model }}
where {{ column_name }} > {{ date2 }}

{% endtest %}
