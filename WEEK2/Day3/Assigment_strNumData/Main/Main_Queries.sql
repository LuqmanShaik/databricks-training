QUERY 1:
SELECT 
CONCAT(UPPER(LEFT(emp_name , 1)), 
       LOWER(SUBSTRING(emp_name , 2)))
       AS Employee_name , 
 ROUND(BONUS + IFNULL(bonus , 0)) AS TOTAL_INCOME,
 YEAR(joining_date) AS Joining_year , 
 CASE 
 WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) > 7
 THEN 'Senior'
 WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) BETWEEN 4 AND 7
 THEN 'Mid'
 ELSE 'Junior'
 END AS Employee_levl
 FROM employee_payments;

QUERY 2:
SELECT 
UPPER(customer_name) AS Customer_Name,
DATEDIFF(
  IFNULL(DELIVERY_DATE , CURDATE()),ORDER_DATE)
  AS delivery_days,
TRUNCATE(ORDER_AMOUNT ,1) AS truncated_amount, 
CASE 
WHEN DELIVERy_DATE IS NULL 
THEN 'PENDING'
WHEN DATEDIFF(DELIVERY_DATE,ORDER_DATE) = 0 
THEN 'SAME-DAY'
WHEN DATEDIFF(DELIVERY_DATE,ORDER_DATE)> 3
THEN 'DELAYED'
ELSE 'NORMAL'
END AS delivery_status
FROM orders_delivery;

QUERY 3:

