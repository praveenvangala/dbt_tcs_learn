with
    nations as (
        select
            n_nationkey as nation_id,
            n_name as name,
            n_regionkey as region_id,
            n_comment,
            current_timestamp as loaded_dt
        from {{ source("src", "nations") }}
    )

select *
from nations
