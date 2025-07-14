with
    customers as (
        select id as customerid, name as customername
        from {{ source ('src', 'customers') }}
    )

select *
from customers
