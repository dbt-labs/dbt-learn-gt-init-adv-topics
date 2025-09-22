with test as (
    select * from {{ source('jaffle_shop', 'customers') }}
)
select * from test
