with
    items as (
        select id as order_item_id, order_id as order_id, sku as product_id
        from {{ source("src", "items") }}
    )

select *
from items
