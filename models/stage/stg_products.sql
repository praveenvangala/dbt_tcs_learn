with
    products as (
        select
            SKU as sku, 
            NAME as prodcutname, 
            TYPE as producttype, 
            PRICE as price, 
            DESCRIPTION as DESCRIPTION, 
            UPDATE_AT as updateat,
             price/100 as product_price,

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
