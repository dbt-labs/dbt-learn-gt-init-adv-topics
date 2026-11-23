-- Each matching page has at least its page_view event. The current duration
-- estimator contributes ten units per event, so it is a positive multiple of ten.
select
    event_id,
    page_view_id,
    approx_time_on_page
from {{ ref('fct_page_views') }}
where approx_time_on_page is null
    or approx_time_on_page < 10
    or mod(approx_time_on_page, 10) <> 0
