with
    regions as (
        select 
        r_regionkey as region_id, 
        r_name, r_comment
        from {{ source("src", "regions") }}
    )

select *
from regions
