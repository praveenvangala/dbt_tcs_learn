with
    items as (
        select id as itemid, order_id as orderid, sku as sku
        from {{ source("src", "items") }}
    )

select *
from items
