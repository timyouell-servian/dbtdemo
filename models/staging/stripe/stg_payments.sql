select
    payments.id as payment_id,
    payments.orderid as order_id,
    payments.paymentmethod as payment_method,
    orders.status,

    -- amount is stored in cents, convert it to dollars
    payments.amount / 100 as amount,
    orders.order_date as created_at

from {{ source('stripe', 'payment') }} payments
left join {{ source('jaffle_shop', 'orders') }} orders on orders.id = payments.orderid