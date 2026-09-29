with source as (

    select * from {{ source('raw_jaffle_shop', 'customers','orders') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        email,
        _elt_updated_at

    from source

)

select * from renamed