-- Is there a difference in revenue on weekends vs weekdays?
select
    case 
        when dayofweek(order_date) IN (1, 7) then 'Weekend' -- Sunday=1, Saturday=7
        else 'Weekday'
    end AS day_type,
    count(distinct order_id) AS total_orders,
    round(sum(total_price),0) AS total_revenue,
    round(avg(total_price), 2) AS avg_order_value
from pizza_sales
group by day_type
order by field(day_type, 'Weekday', 'Weekend');
