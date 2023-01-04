--select * from alpha_project_edw.raw.order_products_prior
with raw_order_products_prior as (
    select * from {{source('alpha_project_edw','orders_product_prior')}}
)
SELECT
    order_id,
    product_id,
    add_to_cart_order,
    reordered
FROM
    raw_order_products_prior