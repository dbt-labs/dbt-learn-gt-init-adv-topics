{% test date_compare(model, column_name, date2) %}

select *
from {{ model }}
where {{ column_name }} > {{ date2 }}

{% endtest %}
