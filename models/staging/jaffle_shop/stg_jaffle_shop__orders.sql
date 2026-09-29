with 

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select
        id as order_id,
        user_id as bus_id,
        order_date as order_Date,
        status as ord_sts,
        _etl_loaded_at

    from source

)

select * from renamed