select
amount
from {{ ref("stg_stripe__payment") }}
where amount <= 5