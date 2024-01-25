select
    id as customer_id,
    first_name + 'Changed' as first_name,
    last_name

from {{ source('jaffle_shop', 'customers') }}