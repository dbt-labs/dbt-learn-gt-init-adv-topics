{% test date_compare(model, column_name, date2) %}

select {{ column_name }}, {{ date2 }}
from {{ model }}
where {{ column_name }} < {{ date2 }}

{% endtest %}