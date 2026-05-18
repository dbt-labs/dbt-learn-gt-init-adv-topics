with 

source as (

    select * from {{ source('stripe', 'payments') }}

),

renamed as (

    select *

    from source

)

select * from renamed