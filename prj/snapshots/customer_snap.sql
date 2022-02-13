{{ config(materialized='table') }}


{% snapshot customer_snapshot %}

{{
    config(
      target_database='dvdrental',
      target_schema='snapshots',
      unique_key='customer_id',

      strategy='check',
      check_cols='all'
    )
}}

select * from customer

{% endsnapshot %}