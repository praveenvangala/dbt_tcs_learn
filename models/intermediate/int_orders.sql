with
    orders as (

        select
            order_id,
            customer_id,
            location_id,
            subtotal,
            order_total,
            currencymacro(order_total,'eur') as order_total_eur,
            currencymacro(order_total,'yen' as order_total_yen,
            tax_paid,
            day_level,
            percent_of_taxpaid,
            percent_of_ordertotal,
            ordered_at
        from {{ ref("stg_orders") }}
        --{% if is_increment() %}
        --where ordered_at > ( select max(ordered_at from {{ this }}) )

    )

select *
from orders
