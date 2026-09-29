{% test date_compare(model, column_name, date2) %}

select *
from {{ model }}
where {{ date2 }} < {{ column_name }} 

{% endtest %}