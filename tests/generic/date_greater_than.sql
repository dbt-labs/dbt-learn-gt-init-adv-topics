{% test date_greater_than(model, column_name, date_field) %}


   select * from {{ model }}
   where {{ column_name }} < '{{ date_field }}'


{% endtest %}
