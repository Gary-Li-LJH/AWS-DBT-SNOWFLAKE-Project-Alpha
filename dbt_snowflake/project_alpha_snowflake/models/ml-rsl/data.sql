{{
    config(
        materialized='table'
    )
}}

select
a.product_id,b.up_orders,c.user_mean_days_since_prior,c.user_period,d.user_distinct_products,
a.prod_second_orders,a.prod_reorders,d.user_reorder_ratio,d.user_total_products,b.up_average_cart_position,b.up_first_order,
c.user_orders,b.up_last_order,a.prod_orders,a.prod_first_orders,d.user_id
from {{ ref('prd_features') }} a join {{ ref('up_features') }} b
on a.product_id=b.product_id
join {{ ref('user_features_1') }} c
on b.user_id=c.user_id
join {{ ref('user_features_2') }} d
on b.user_id=d.user_id
