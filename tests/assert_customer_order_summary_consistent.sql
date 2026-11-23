-- Customer counts cannot be negative; customers without orders retain null
-- order summaries, while customers with orders have an ordered date range.
select
    customer_id,
    number_of_orders,
    first_order_date,
    most_recent_order_date,
    lifetime_value
from {{ ref('dim_customers') }}
where number_of_orders is null
    or number_of_orders < 0
    or (
        number_of_orders = 0
        and (
            first_order_date is not null
            or most_recent_order_date is not null
            or lifetime_value is not null
        )
    )
    or (
        number_of_orders > 0
        and (
            first_order_date is null
            or most_recent_order_date is null
            or lifetime_value is null
            or first_order_date > most_recent_order_date
        )
    )
