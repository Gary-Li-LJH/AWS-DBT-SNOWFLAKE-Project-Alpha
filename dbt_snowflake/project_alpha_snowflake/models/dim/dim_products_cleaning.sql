--SQL
--Create a dim table name dim_products_cleaning referring to the scr_products table in src layer
--Trim the product_name column and remove the space in the beginning and end of the aisle column

with src_products as(
    select * 
    from {{ ref('src_products') }}
    )
select
    product_id,
    trim(product_name) as product_name,
    aisle_id,
    department_id
from src_products