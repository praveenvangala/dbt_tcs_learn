with
    products as (
        select
            SKU as product_id, 
            NAME as prodcut_name, 
            TYPE as product_type, 
            DESCRIPTION as product_desc, 
            PRICE as product_price, 
            UPDATE_AT as update_at,
            price/100 as product_price_percent,

            case when type='jaffle'
                then 1
                else 0
            end as is_food_item,
            
            case when type='beverage'
                then 1
                else 0
            end as is_drink_item
            
        from {{ source("src", "products") }}
        
    )

select *
from products
