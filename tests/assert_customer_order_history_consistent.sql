-- Customer history should agree with whether the customer has any orders.
-- Debug failures by comparing the customer's rows in fct_orders and dim_customers.
select
    customer_id,
    number_of_orders,
    first_order_date,
    most_recent_order_date,
    lifetime_value
from {{ ref('dim_customers') }}
where
    number_of_orders < 0
    or number_of_orders <> floor(number_of_orders)
    or first_order_date > most_recent_order_date
    or (
        number_of_orders = 0
        and (
            first_order_date is not null
            or most_recent_order_date is not null
            or lifetime_value is not null
        )
    )
