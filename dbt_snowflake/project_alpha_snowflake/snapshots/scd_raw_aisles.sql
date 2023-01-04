--sql
--create a snapshot of the aisles table in DBT


{% snapshot scd_raw_aisles %}


{{config(
       unique_key='aisle_id',
       strategy='check',
       check_cols=['aisle'],
       invalidate_hard_deletes=True
)}}


select * from {{source('alpha_project_edw','aisles')}}

{% endsnapshot %}