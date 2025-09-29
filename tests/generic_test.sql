{% test not_below_threshold(model, column_name, lowest_valid_value) %}

    select *
    from {{ model }}
    where {{ column_name }} <= {{ lowest_valid_value }}

{% endtest %}