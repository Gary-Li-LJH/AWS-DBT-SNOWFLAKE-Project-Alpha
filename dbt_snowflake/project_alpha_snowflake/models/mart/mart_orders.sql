--sql
--create a full orders table in the mart layer
--join fct_orders_detial table with dim_product_detail table
--materialize the orders table in the mart layer

{{ config(
    materialized='table'
) }}
WITH
    fct_orders_detail AS (
        SELECT
            *
        FROM {{ ref('fct_orders_detail') }}
    ),
    dim_products_detail AS (
        SELECT
            *
        FROM {{ ref('dim_products_detail') }}
    )

SELECT
    fct_orders_detail.*,
    dim_products_detail.product_name,
    dim_products_detail.aisle,
    dim_products_detail.department
FROM fct_orders_detail
JOIN dim_products_detail
ON fct_orders_detail.product_id = dim_products_detail.product_id

