--select * from alpha_project_edw.raw.departments
with raw_departments as (
    select * from {{source('alpha_project_edw','departments')}}
)
SELECT
    department_id,
    department
FROM
    raw_departments