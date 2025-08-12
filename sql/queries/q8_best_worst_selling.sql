-- Best and worst selling pizzas by quantity sold
WITH sales_summary AS 
	(SELECT
        pizza_name,
        SUM(quantity) AS total_units_sold
    FROM pizza_sales
    GROUP BY pizza_name)
    (SELECT
        'Best Selling' AS category,
        pizza_name,
        total_units_sold
    FROM sales_summary
    ORDER BY total_units_sold DESC
    LIMIT 5)
UNION ALL
    (SELECT
        'Worst Selling' AS category,
        pizza_name,
        total_units_sold
    FROM sales_summary
    ORDER BY total_units_sold ASC
    LIMIT 5);   
