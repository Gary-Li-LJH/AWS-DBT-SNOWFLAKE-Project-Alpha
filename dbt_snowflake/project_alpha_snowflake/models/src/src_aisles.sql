--select * from alpha_project_edw.raw.aisles
with raw_aisles as (
    select * from {{source('alpha_project_edw','aisles')}}
)
SELECT
    aisle_id,
    aisle
FROM
    raw_aisles