with test as (
    select * from {{ source('stripe', 'payments') }}
)
select * from test
