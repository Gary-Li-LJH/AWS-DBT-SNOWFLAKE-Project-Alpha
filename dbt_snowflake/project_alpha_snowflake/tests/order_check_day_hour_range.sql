--sql
--check the order_dow and order_hour_of_day in orders table
select 
*
FROM {{ref('src_orders')}}
where order_dow >7 or order_hour_of_day > 24