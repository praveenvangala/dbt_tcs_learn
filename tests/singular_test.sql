{{
    config(
        schema = 'testing',
        store_failures = true
    )
}}
 
with orders as (
    select * from {{ ref('stg_orders') }}
)
 
select order_id, sum(order_total+1) ordertotal
from orders
group by 1
having ordertotal=0