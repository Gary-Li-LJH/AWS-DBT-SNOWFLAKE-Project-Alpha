--SQL
--Create a dim table name dim_orders_product_prior_cleaning referring to the scr_orders_product_prior table in src layer

with src_orders_product_prior as (
    SELECT * FROM {{ ref('src_orders_product_prior') }}
)
SELECT 
  *
FROM src_orders_product_prior
