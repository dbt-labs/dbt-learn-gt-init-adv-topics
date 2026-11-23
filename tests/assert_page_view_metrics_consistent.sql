-- A non-null grouping key must include at least the retained page-view event.
-- On failure, inspect all staging events sharing page_view_id and the aggregate join.
select
    event_id,
    page_view_id,
    approx_time_on_page,
    page_view_start,
    max_collector_tstamp,
    derived_tstamp,
    collector_tstamp
from {{ ref('fct_page_views') }}
where page_view_id is not null
    and (
        approx_time_on_page is null
        or approx_time_on_page < 10
        or mod(approx_time_on_page, 10) <> 0
        or (derived_tstamp is not null and page_view_start is null)
        or page_view_start > derived_tstamp
        or (collector_tstamp is not null and max_collector_tstamp is null)
        or max_collector_tstamp < collector_tstamp
    )
