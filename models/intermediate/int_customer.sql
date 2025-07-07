{{
        config(
                materialized='incremental', unique_key='customer_id', on_schema_change='append_new_columns'
        )
}}
 
with customer as (
select
        customer_id,
        nation_id,
        name,
        address,
        phone_number,
        account_balance,
        market_segment,
        comment,
        current_timestamp as updt_ts
from {{ ref('stg_customers') }}
)
 
select * from customer
{% if is_incremental() %}
where customer_id < 1000
{% endif %}