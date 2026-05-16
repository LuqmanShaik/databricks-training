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
