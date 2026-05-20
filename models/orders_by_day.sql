{{
    config(
        materialized='table'
    )
}}

with orders as (
    select order_date, count(*) as orders
    from {{ ref('stg_jaffle_shop__orders') }}
    group by order_date
  ),
  previous_day_orders as (
    select order_date, lag(orders) over (order by order_date) as previous_day_orders
    from orders
  )
  select *
  from previous_day_orders
