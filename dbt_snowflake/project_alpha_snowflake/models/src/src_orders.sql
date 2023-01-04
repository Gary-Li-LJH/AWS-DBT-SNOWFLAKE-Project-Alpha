--select * from alpha_project_edw.raw.orders    
with raw_orders as (
    select * from {{source('alpha_project_edw','orders')}}
)
SELECT
    order_id,
    user_id,
    eval_set,
    order_number,
    order_dow,
    order_hour_of_day,
    days_since_prior_order
FROM
    raw_orders
WHERE
    eval_set = 'prior'