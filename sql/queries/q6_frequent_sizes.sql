-- What are the most frequently ordered pizza sizes and types in each month?
with monthly_sales as
	(select 
		date_format(order_date, '%Y-%m') as month_of_order,
        pizza_size,
        pizza_name,
        sum(quantity) as total_quantity
	from pizza_sales
    group by date_format(order_date, '%Y-%m'), pizza_size, pizza_name),
    ranked as
    (select
		month_of_order,
        pizza_size,
        pizza_name,
        total_quantity,
        rank() over(partition by month_of_order order by total_quantity desc) as size_type_rank
	from monthly_sales)
select *
from ranked
where size_type_rank <=5
order by month_of_order, size_type_rank;
