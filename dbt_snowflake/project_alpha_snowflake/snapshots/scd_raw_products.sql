--sql
--create a snapshot of the products table in DBT


{% snapshot scd_raw_products %}


{{config(
       unique_key='product_id',
       strategy='check',
       check_cols="all",
       invalidate_hard_deletes=True
)}}


select * from {{source('alpha_project_edw','products')}}

{% endsnapshot %}