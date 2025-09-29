select
amount
from {{ ref("stg_jaffle_shop__orders") }}
where amount <= 5