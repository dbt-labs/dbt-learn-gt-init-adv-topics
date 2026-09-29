with customers as (

    select
        customer_id,
        first_name,
        last_name

    from {{ ref('stg_jaffle_shop__customers') }}

),

customer_orders as (

    select
        customer_id,
        first_order_date,
        most_recent_order_date,
        number_of_orders

    from {{ ref('customer_orders') }}

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final
