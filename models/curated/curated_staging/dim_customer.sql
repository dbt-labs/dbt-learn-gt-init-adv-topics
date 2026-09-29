

with source as (

    select * from {{ source('raw_jaffle_shop', 'customers') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
       
    from raw.raw_jaffle_shop.cu ((raw_jaffle_shop__customers))


)

select * from renamed