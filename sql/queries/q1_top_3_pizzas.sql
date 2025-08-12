-- What are the Top 3 best-selling pizzas each month by quantity?
with monthly_sales as
	(select
        month(order_date) as month_of_order,
        pizza_name,
        SUM(quantity) as total_quantity,
        rank() over (partition by month(order_date) order by SUM(quantity) desc) as rank_in_month
    from pizza_sales
    group by month_of_order, pizza_name)
select *
from monthly_sales
where rank_in_month <= 3
order by month_of_order, rank_in_month;
