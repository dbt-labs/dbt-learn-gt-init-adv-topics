select
    amount
from {{ref('orders')}}
where amount <= 5