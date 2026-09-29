with 

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select
        id as Order_id,
        user_id as Customer_id,
        order_date as Order_Order_date,
        status as Order_Status,
        _etl_loaded_at

    from source

)

select * from renamed