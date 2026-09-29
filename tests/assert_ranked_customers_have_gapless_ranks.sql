with rank_summary as (

    select
        number_of_orders,
        customer_rank,
        dense_rank() over (
            order by number_of_orders desc
        ) as expected_rank

    from {{ ref('ranked_customers') }}

    group by 1, 2

)

select *
from rank_summary
where
    customer_rank != expected_rank
    or customer_rank < 1
