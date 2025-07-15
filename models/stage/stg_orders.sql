with
    orders as (
        select
            id as order_id,
            customer_id as customer_id,
            store_id as location_id,
            subtotal as subtotal,
            order_total as order_total,
            tax_paid as tax_paid,
            date_part(day, ordered_at) as day_level,            
            100 * ratio_to_report(tax_paid) over () as percent_of_taxpaid,
            100 * ratio_to_report(order_total) over () as percent_of_ordertotal
        from {{ source("src", "orders") }}
        qualify order_total <> 0
    )

select *
from orders
