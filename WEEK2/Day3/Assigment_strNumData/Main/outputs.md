**Query #1**

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

| Employee_name | TOTAL_INCOME | Joining_year | Employee_levl |
| ------------- | ------------ | ------------ | ------------- |
| Karthik       | 10001        | 2019         | Mid           |
| Veena         | 8001         | 2021         | Mid           |
| Ravi          | 12002        | 2016         | Senior        |
| Anil          |              | 2020         | Mid           |
| Suresh        | 6001         | 2022         | Junior        |

---

**Query #2**

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

| Customer_Name | delivery_days | truncated_amount | delivery_status |
| ------------- | ------------- | ---------------- | --------------- |
| RAJESH        | 4             | 12500.7          | DELAYED         |
| MEENA         | 0             | 8400.4           | SAME-DAY        |
| ARUN          | 5             | 15600.9          | DELAYED         |
| POOJA         | 483           | 9200.1           | PENDING         |

---

**Query #3**

    SELECT 
    CONCAT(
      UPPER(LEFT(cust_name , 1)),
      LOWER(SUBSTRING(cust_name , 2))
      ) AS customer_name, 
    MONTHNAME(purchase_date) AS Purchase_month,
    ROUND(PURCHASE_AMOUNT) AS rouded_amount,
    ABS(PURCHASE_AMOUNT) AS absolute_amount, 
    CASE 
    WHEN purchase_amount > 15000
    THEN 'High Spender'
    WHEN PURCHASE_AMOUNT BETWEEN 8000 AND 15000
    THEN 'Medium'
    ELSE 'Low Spender'
    END AS Spending_type
    FROM customer_spending;

| customer_name | Purchase_month | rouded_amount | absolute_amount | Spending_type |
| ------------- | -------------- | ------------- | --------------- | ------------- |
| Amit          | December       | 12001         | 12000.75        | Medium        |
| Neha          | December       | 8500          | 8500.4          | Medium        |
| Rohit         | November       | 15501         | 15500.9         | High Spender  |
| Kavya         | October        | 6000          | 6000.1          | Low Spender   |

---
