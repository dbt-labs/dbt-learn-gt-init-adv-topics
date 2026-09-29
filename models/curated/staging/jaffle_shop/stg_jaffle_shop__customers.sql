with 

source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
        id as Customer_id,
        first_name as Customer_First_Name,
        last_name as Customer_Last_Name

    from source

)

select * from renamed