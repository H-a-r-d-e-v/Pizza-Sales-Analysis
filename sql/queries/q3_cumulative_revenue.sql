-- What is the cumulative revenue trend throughout the year?
select 
	distinct month(order_date) as Month_of_Order,
    round(sum(total_price) over(partition by month(order_date)),0) as Total_Monthly_Revenue,
    round(sum(total_price)over(order by month(order_date)),0) as Running_Total
from pizza_sales;
