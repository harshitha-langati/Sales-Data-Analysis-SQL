USE ecommerce_sales;
LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state);
SELECT COUNT(*) FROM customers;
SELECT * FROM customers
LIMIT 10;
USE ecommerce_sales;
USE ecommerce_sales;

CREATE TABLE orders (
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TEXT,
    order_approved_at TEXT,
    order_delivered_carrier_date TEXT,
    order_delivered_customer_date TEXT,
    order_estimated_delivery_date TEXT
);
SHOW TABLES;
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
);
SELECT COUNT(*) FROM orders;
USE ecommerce_sales;

CREATE TABLE order_items (
    order_id TEXT,
    order_item_id INT,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TEXT,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);
SHOW TABLES;
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
);
SELECT COUNT(*) FROM order_items;
USE ecommerce_sales;

CREATE TABLE products (
    product_id TEXT,
    product_category_name TEXT,
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
SHOW TABLES;
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
);
SELECT COUNT(*) FROM products;
USE ecommerce_sales;

CREATE TABLE sellers (
    seller_id TEXT,
    seller_zip_code_prefix INT,
    seller_city TEXT,
    seller_state TEXT
);
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
);
SELECT COUNT(*) FROM sellers;
USE ecommerce_sales;

CREATE TABLE payments (
    order_id TEXT,
    payment_sequential INT,
    payment_type TEXT,
    payment_installments INT,
    payment_value DECIMAL(10,2)
);
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_order_payments_dataset.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
);
SELECT COUNT(*) FROM payments;
USE ecommerce_sales;

CREATE TABLE reviews (
    review_id TEXT,
    order_id TEXT,
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TEXT,
    review_answer_timestamp TEXT
);
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_order_reviews_dataset.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
);
SELECT COUNT(*) FROM reviews;
USE ecommerce_sales;

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10,8),
    geolocation_lng DECIMAL(11,8),
    geolocation_city TEXT,
    geolocation_state TEXT
);
SHOW TABLES;
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/olist_geolocation_dataset.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
);
SELECT COUNT(*) FROM geolocation;
USE ecommerce_sales;

CREATE TABLE category_translation (
    product_category_name TEXT,
    product_category_name_english TEXT
);
USE ecommerce_sales;

LOAD DATA LOCAL INFILE 'C:/Users/HARSHITHA/OneDrive/Desktop/SQL_Sales_Analysis/Dataset/product_category_name_translation.csv'
INTO TABLE category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    product_category_name,
    product_category_name_english
);
SELECT COUNT(*) FROM category_translation;
USE ecommerce_sales;

SHOW TABLES;
SELECT 'customers' AS table_name, COUNT(*) AS total_records FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL
SELECT 'category_translation', COUNT(*) FROM category_translation;
SELECT *
FROM customers
WHERE customer_id IS NULL;
SELECT *
FROM customers
WHERE customer_city IS NULL
   OR customer_state IS NULL;
   SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
SELECT *
FROM order_items
WHERE price <= 0
   OR freight_value < 0;
   SELECT COUNT(*) AS total_customers
FROM customers;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT DISTINCT order_status
FROM orders;
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;
SELECT
    product_id,
    price
FROM order_items
ORDER BY price DESC
LIMIT 10;
SELECT
    c.customer_unique_id,
    SUM(oi.price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spending DESC
LIMIT 10;
SELECT
    ct.product_category_name_english,
    SUM(oi.price) AS total_sales
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN category_translation ct
    ON p.product_category_name =
       ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY total_sales DESC;
SELECT
    c.customer_state,
    SUM(oi.price) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_sales DESC;
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(price + freight_value) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_summary;
SELECT
    YEAR(o.order_purchase_timestamp) AS sales_year,
    MONTH(o.order_purchase_timestamp) AS sales_month,
    SUM(oi.price) AS monthly_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)
ORDER BY sales_year, sales_month;
WITH product_sales AS (
    SELECT
        product_id,
        SUM(price) AS total_sales
    FROM order_items
    GROUP BY product_id
)
SELECT
    product_id,
    total_sales,
    DENSE_RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM product_sales;
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT *
FROM customer_orders
WHERE total_orders > 1
ORDER BY total_orders DESC;
SELECT
    COUNT(*) AS late_deliveries
FROM orders
WHERE order_delivered_customer_date >
      order_estimated_delivery_date;
      WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(
            o.order_purchase_timestamp, '%Y-%m'
        ) AS sales_month,
        SUM(oi.price) AS total_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY sales_month
),
sales_growth AS (
    SELECT
        sales_month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY sales_month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    sales_month,
    total_sales,
    previous_month_sales,
    ROUND(
        (total_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0) * 100,
        2
    ) AS growth_percentage
FROM sales_growth
ORDER BY sales_month;