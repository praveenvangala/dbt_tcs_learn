with
    orders as (
        select
            id as orderid,
            CUSTOMER_ID as customerid,
            date_part(day, ordered_at) as day_level,
            store_id as storeid,
            subtotal as subtotal,
            100 * ratio_to_report(tax_paid) over () as percent_of_taxpaid,
            100 * ratio_to_report(order_total) over () as percent_of_ordertotal
        from {{ source("src", "orders") }}
        qualify order_total <> 0
    )

select *
from orders
