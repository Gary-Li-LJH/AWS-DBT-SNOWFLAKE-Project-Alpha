--sql
--join dim_aisles_cleaning table,dim_products_cleaning table and dim_departments_cleaning table
--materialize the result in a new table
{{ config(
    materialized='table',
    )}}

WITH 
    dim_aisles_cleaning AS (
        SELECT 
        *
        FROM {{ref('dim_aisles_cleaning')}}
        ),
    dim_products_cleaning AS (
        SELECT 
        *
        FROM {{ref('dim_products_cleaning')}}
        ),
    dim_departments_cleaning AS (
        SELECT 
        *
        FROM {{ref('dim_departments_cleaning')}}
        )
SELECT
    dim_products_cleaning.product_id,
    dim_products_cleaning.product_name,
    dim_aisles_cleaning.aisle_id,
    dim_aisles_cleaning.aisle,
    dim_departments_cleaning.department_id,
    dim_departments_cleaning.department
FROM dim_aisles_cleaning
INNER JOIN dim_products_cleaning
ON dim_aisles_cleaning.aisle_id = dim_products_cleaning.aisle_id
INNER JOIN dim_departments_cleaning
ON dim_departments_cleaning.department_id = dim_products_cleaning.department_id
