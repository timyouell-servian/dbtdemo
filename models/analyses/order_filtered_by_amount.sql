select
    order_id,
    customer_id,
    order_date,
    amount
from {{ ref('fct_orders') }}
where amount > 10
order by 2