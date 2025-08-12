-- What is the monthly revenue growth rate compared to the previous month?
WITH monthly_revenue as
	(select
		MONTH(order_date) as month_of_order,
		round(sum(total_price),0) as revenue
	from pizza_sales
	GROUP BY MONTH(order_date))
select 
	month_of_order,
	revenue,
	lag(revenue) over(order by Month_of_order) as prev_month_revenue,
	round((revenue-(lag(revenue) over(order by Month_of_order)))/(lag(revenue) over(order by Month_of_order))*100,2) as Monthly_growth
from monthly_revenue
order by month_of_order;
