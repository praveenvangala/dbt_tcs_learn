{% snapshot products_snapshot %}
 
{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key=['product_id'],
 
      strategy='timestamp',
      updated_at='update_at',
    )
}}
 
select * from {{ ref('stg_products') }}

 
{% endsnapshot %}
