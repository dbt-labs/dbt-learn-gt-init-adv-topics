{{
    config(
        tags='nightly'
    )
}}

with 

source as (

    select * from {{ source('snowplow', 'events') }}
    where collector_tstamp BETWEEN '2026-05-19 00:00:00' AND '2026-05-19 23:59:59'
    and event = 'page_view'

),

renamed as (

    select
        event_id,
        page_view_id,
        anonymous_user_id,
        session_id,
        event,
        device_type,
        page_url,
        page_title,
        page_urlscheme,
        page_urlhost,
        page_urlport,
        page_urlpath,
        page_urlquery,
        page_urlfragment,
        collector_tstamp,
        derived_tstamp

    from source

)

select * from renamed
