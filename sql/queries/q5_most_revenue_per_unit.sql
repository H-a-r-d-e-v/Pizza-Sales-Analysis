-- Which pizza generates the most revenue per unit sold?
select
	pizza_name,
    round(sum(total_price),0) as total_revenue,
    sum(quantity) as total_units_sold,
    round(sum(total_price)/sum(quantity),2) as revenue_per_unit
from pizza_sales
group by pizza_name
order by revenue_per_unit desc
limit 1;
