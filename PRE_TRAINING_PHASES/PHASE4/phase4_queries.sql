-- Task 1: Daily Sales Report
SELECT
sale_date,
SUM(total_amount) AS total_sales
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

-- Task 2: City-wise Revenue
SELECT
c.city,
SUM(s.total_amount) AS total_revenue
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- Task 3: Top 5 Customers
SELECT
c.customer_name,
SUM(s.total_amount) AS total_spend
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_name
ORDER BY total_spend DESC
LIMIT 5;

-- Task 4: Repeat Customers
SELECT
customer_id,
COUNT(sale_id) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(sale_id) > 1
ORDER BY order_count DESC;

-- Task 5: Customer Segmentation
SELECT
c.customer_name,
SUM(s.total_amount) AS total_spend,
CASE
    WHEN SUM(s.total_amount) > 10000 THEN 'Gold'
    WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000 THEN 'Silver'
    ELSE 'Bronze'
END AS segment
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_name
ORDER BY total_spend DESC;

-- Task 6: Final Reporting Table
SELECT
c.customer_name,
c.city,
SUM(s.total_amount) AS total_spend,
COUNT(s.sale_id) AS order_count,
CASE
    WHEN SUM(s.total_amount) > 10000 THEN 'Gold'
    WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000 THEN 'Silver'
    ELSE 'Bronze'
END AS segment
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_name, c.city
ORDER BY total_spend DESC;

-- Task 7: View Final Report
SELECT * FROM final_report;
