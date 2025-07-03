with
    nations as (
        select n_nationkey, n_name, n_regionkey, n_comment
        from {{ source("src", "nations") }}
    )

select *
from nations
