{{
    config(
        materialized='view'
    )
}}

SELECT a.*, 
 b.product_id, 
 b.add_to_cart_order, 
 b.reordered 
FROM {{ ref('src_orders') }} a 
 JOIN {{ ref('src_orders_product_prior') }} b 
 ON a.order_id = b.order_id 
WHERE a.eval_set = 'prior'