{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('stg_test_model') }}