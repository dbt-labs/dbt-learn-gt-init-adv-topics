{{
    config(
        severity='warn',
        warn_if ='<50'
    )
}}
select
    *
    from {{ ref('dim_customers') }}
    where number_of_orders < 1