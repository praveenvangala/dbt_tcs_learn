with
    customers as (
        select id as customer_id, 
        name as customer_name
        from {{ source("src", "customers") }}
    )

select *
from customers
