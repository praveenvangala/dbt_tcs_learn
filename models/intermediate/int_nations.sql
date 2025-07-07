{{
        config(
                materialized='incremental', unique_key='nation_id'
        )
}}
 
with nation as (
select
        nation_id,
        name,
        region_id,
        loaded_dt
from {{ ref('stg_nations') }}
)
 
select * from nation
{% if is_incremental() %}
where loaded_dt > (select max(loaded_dt) from {{this}})
{% endif %}