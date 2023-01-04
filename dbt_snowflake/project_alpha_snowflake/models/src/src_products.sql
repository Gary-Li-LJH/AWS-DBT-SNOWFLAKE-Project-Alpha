--select * from alpha_project_edw.raw.products
with raw_products as (
    select * from {{source('alpha_project_edw','products')}}
)
SELECT
    product_id,
    product_name,
    aisle_id,
    department_id
FROM
    raw_products