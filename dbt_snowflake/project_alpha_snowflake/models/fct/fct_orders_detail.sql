--sql
--join the orders_cleaning table with the orders_product_prior table
--on the order_id column
--materialize the result as table
--save the result as orders_detail table
{{
    config(
        materialized='table'
    )
}}

WITH
    dim_orders_cleaning AS (
        SELECT
        *
        FROM {{ref('dim_orders_cleaning')}}
    ),
    dim_orders_products_prior_cleaning AS (
        SELECT
        *
        FROM {{ref('dim_orders_products_prior_cleaning')}}
    )
SELECT
    dim_orders_cleaning.*,
    dim_orders_products_prior_cleaning.product_id,
    dim_orders_products_prior_cleaning.add_to_cart_order,
    dim_orders_products_prior_cleaning.reordered 
FROM 
    dim_orders_cleaning
LEFT JOIN dim_orders_products_prior_cleaning
ON dim_orders_cleaning.order_id = dim_orders_products_prior_cleaning.order_id
