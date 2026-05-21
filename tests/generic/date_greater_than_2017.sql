{% test date_greater_than(model, column_name, date_field) %} 
{{ config(warn_if = '<50', error_if = '>=50') }}
select * from {{ model }} 
where {{ column_name }} < '{{ date_field }}' 
{% endtest %}
