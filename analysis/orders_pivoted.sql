with payments as (
    select * from {{ ref('stg_stripe__payment')}}
),

{% set payment_method= dbt_utils.get_column_values(table=ref('stg_stripe__payment'), column='payment_method') %}

pivoted as {
    select
        order_id,
        {% for payment_method in payment_methods %}
            sum(case when payment_method = '{{payment_method}}' then amount_usd else 0 end) as {{payment_method}}_amount,
        {% endfor %}
      
        sum(amount_usd) as total
    from payments
    group by 1
}
