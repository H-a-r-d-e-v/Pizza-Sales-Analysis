-- What is the average order value segmented by time of day?
WITH order_totals AS
	(SELECT 
		order_id,
		SUM(total_price) AS order_value,
		MIN(order_time) AS order_time -- earliest time for the order
		FROM pizza_sales
		GROUP BY order_id),
	time_segments AS
	(SELECT
		order_id,
		order_value,
		CASE
  		WHEN HOUR(order_time) BETWEEN 5 AND 11 THEN 'Morning'
  		WHEN HOUR(order_time) BETWEEN 12 AND 16 THEN 'Afternoon'
  		WHEN HOUR(order_time) BETWEEN 17 AND 21 THEN 'Evening'
		ELSE 'Night'
		END AS time_of_day
	FROM order_totals)
SELECT
    time_of_day,
    ROUND(AVG(order_value), 2) AS avg_order_value,
    COUNT(*) AS total_orders
FROM time_segments
GROUP BY time_of_day
ORDER BY FIELD(time_of_day, 'Morning', 'Afternoon', 'Evening', 'Night');
