--sql
--create a snapshot of the departments table in DBT


{% snapshot scd_raw_departments %}


{{config(
       unique_key='department_id',
       strategy='check',
       check_cols=['dempartment'],
       invalidate_hard_deletes=True
)}}


select * from {{source('alpha_project_edw','departments')}}

{% endsnapshot %}