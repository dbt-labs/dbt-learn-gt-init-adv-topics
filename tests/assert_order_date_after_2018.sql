-- tests/assert_order_date_after_2018.sql
-- Assumption: no Jaffle Shop order is dated before 2018
select
    order_id,
    customer_id,
    order_date
from {{ ref('stg_jaffle_shop__orders') }}
where order_date < '2018-01-01'