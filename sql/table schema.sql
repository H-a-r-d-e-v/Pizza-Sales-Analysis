CREATE TABLE `pizza_sales` (
    `order_details_id` INT PRIMARY KEY,
    `order_id` INT,
    `pizza_id` VARCHAR(20),
    `pizza_name` VARCHAR(100),
    `pizza_ingredients` VARCHAR(255),
    `pizza_category` VARCHAR(50),
    `pizza_size` CHAR(3),
    `quantity` INT,
    `unit_price` DECIMAL(6,2),
    `total_price` DECIMAL(8,2),
    `order_date` DATE NOT NULL,
    `order_time` TIME NOT NULL
);