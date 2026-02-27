
SELECT 
    CAST(year AS INT) AS sales_year,
    SUM(grand_total) AS total_sales
FROM orders
GROUP BY CAST(year AS INT)
ORDER BY sales_year DESC;



SELECT
    payment_method,
    AVG(discount_amount) AS avg_discount,
    COUNT(*) AS transaction_count
FROM orders
GROUP BY payment_method
HAVING COUNT(*) > 100
ORDER BY avg_discount DESC;


SELECT TOP 5
    category_name_1,
    SUM(qty_ordered) AS total_quantity_ordered
FROM orders
GROUP BY category_name_1
ORDER BY total_quantity_ordered DESC;


SELECT *
FROM orders
WHERE grand_total > (
    SELECT AVG(grand_total)
    FROM orders
);

SELECT
    [Customer_ID] AS customer_id,
    MIN(created_at) AS first_order_date,
    MAX(created_at) AS last_order_date
FROM orders
GROUP BY [Customer_ID]
ORDER BY first_order_date;






SELECT
    increment_id,
    category_name_1,
    grand_total,
    RANK() OVER (
        PARTITION BY category_name_1
        ORDER BY grand_total DESC
    ) AS sales_rank
FROM orders;



SELECT
    increment_id,
    grand_total
FROM orders
WHERE discount_amount > (
    SELECT AVG(discount_amount)
    FROM orders
);

SELECT
    [Customer_ID] AS customer_id,
    MIN(created_at) AS customer_since,
    COUNT(DISTINCT increment_id) AS total_orders
FROM orders
GROUP BY [Customer_ID]
HAVING 
    MIN(created_at) < '2023-01-01'
    AND COUNT(DISTINCT increment_id) > 5
ORDER BY total_orders DESC;

SELECT
    payment_method,
    SUM(grand_total) AS total_sales,
    DENSE_RANK() OVER (
        ORDER BY SUM(grand_total) DESC
    ) AS sales_rank
FROM orders
GROUP BY payment_method
ORDER BY sales_rank;
