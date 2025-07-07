{{ config(
materialized='table',
alias='int_customer1'
) }}


with
    customer_orders as (
        select c.customer_id, sum(o.total_price) as price, max(o.order_date) o_date

        from {{ ref("stg_customers") }} c

        join {{ ref("stg_orders") }} o on c.customer_id = o.customer_id

        where c.customer_id <= 1000

        group by 1
    )

select *
from customer_orders
