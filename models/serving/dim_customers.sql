with customers as (

    select
        customer_id,
        customer_first_name,
        customer_last_name

    from {{ ref('stg_jaffle_shop__customers') }}

),

orders as (

    select
        order_id,
        customer_id,
        order_date,
        order_status

    from {{ ref('stg_jaffle_shop__orders') }}

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

customer_order_metrics as (

    select
        customers.customer_id,
        customers.customer_first_name,
        customers.customer_last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

),

final as (

    select
        *,
        dense_rank() over (
            order by number_of_orders desc
        ) as customer_order_rank

    from customer_order_metrics

)

select * from final
