Table,"Create Table"
pizza_sales,"CREATE TABLE `pizza_sales` (
  `order_details_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `pizza_id` varchar(20) NOT NULL,
  `pizza_name` varchar(100) NOT NULL,
  `pizza_ingredients` varchar(255) DEFAULT NULL,
  `pizza_category` varchar(50) DEFAULT NULL,
  `pizza_size` char(3) DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(6,2) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  PRIMARY KEY (`order_details_id`),
  KEY `idx_order_date` (`order_date`)
) ENGINE=InnoDB AUTO_INCREMENT=48621 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci"
