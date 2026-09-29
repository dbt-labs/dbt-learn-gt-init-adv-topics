
with source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select
        user_id as customer_id,
        ID as order_id,
        order_date,
        status
    from source

)

select * from renamed