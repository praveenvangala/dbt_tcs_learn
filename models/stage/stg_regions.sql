with
    regions as (
        select r_regionkey, r_name, r_comment from {{ source("src", "regions") }}
    )

select *
from regions
