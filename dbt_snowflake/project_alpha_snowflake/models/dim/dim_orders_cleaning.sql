--SQL
--Create a dim table name dim_orders_cleaning referring to the scr_orders table in src layer
--remove the eval-set from the table
--fill null values with 0 in days_since_prior_order column

with src_orders as (
    SELECT * FROM {{ ref('src_orders') }}
)
SELECT 
    order_id,
    user_id,
    order_number,
    order_dow,
    order_hour_of_day,
    --fill null values with 0 in days_since_prior_order column
    coalesce(days_since_prior_order, 0) as days_since_prior_order
FROM src_orders
