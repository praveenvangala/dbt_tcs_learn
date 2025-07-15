with
    locations as (
        select
        ID as location_id, 
        NAME as location_name,
        TAX_RATE as TAX_RATE,
        date_part(day, OPENED_AT) as opened_at

        from {{ source("src", "stores") }}
        
    )

select *
from locations 






