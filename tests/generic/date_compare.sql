{% test date_compare(model, column_name, date_2) %}

select {{column_name}} as date_1,
{{date_2}}
from {{model}}
where {{date_2}} < {{column_name}}

{% endtest %}