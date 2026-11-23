-- A page-view event must contribute to its own aggregate when its key is present.
-- For failures, inspect staged events sharing page_view_id and their timestamps.
-- A null page_view_id cannot match through the model's equality join.
select
    event_id,
    page_view_id,
    approx_time_on_page,
    page_view_start,
    derived_tstamp,
    collector_tstamp,
    max_collector_tstamp
from {{ ref('fct_page_views') }}
where
    (
        page_view_id is not null
        and (
            approx_time_on_page is null
            or approx_time_on_page < 10
            or mod(approx_time_on_page, 10) <> 0
            or (derived_tstamp is not null and page_view_start is null)
            or page_view_start > derived_tstamp
            or (collector_tstamp is not null and max_collector_tstamp is null)
            or max_collector_tstamp < collector_tstamp
        )
    )
    or (
        page_view_id is null
        and (
            approx_time_on_page is not null
            or page_view_start is not null
            or max_collector_tstamp is not null
        )
    )
