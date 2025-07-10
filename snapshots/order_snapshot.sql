{% snapshot orders_snapshot %}
 
{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key=['order_id', 'updt_ts'],
 
      strategy='timestamp',
      updated_at='updt_ts',
    )
}}
 
select * from {{ ref('stg_orders') }}
where order_id between 600001 and 600005

 
{% endsnapshot %}
