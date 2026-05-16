**Schema (MySQL v8)**

    CREATE TABLE salary_audit (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        tax_percent DECIMAL(5,2),
        last_revision DATE
    );
    
    INSERT INTO salary_audit VALUES
    (1,'karthik',75000.75,10.5,'2022-01-15'),
    (2,'veena',65000.40,18.0,'2023-06-01'),
    (3,'ravi',85000.90,25.0,'2020-11-20');

---

**Query #1**

    SHOW TABLES;

| Tables_in_test |
| -------------- |
| salary_audit   |

---
**Query #2**

    SELECT * FROM salary_audit;

| emp_id | emp_name | salary   | tax_percent | last_revision |
| ------ | -------- | -------- | ----------- | ------------- |
| 1      | karthik  | 75000.75 | 10.5        | 2022-01-15    |
| 2      | veena    | 65000.4  | 18.0        | 2023-06-01    |
| 3      | ravi     | 85000.9  | 25.0        | 2020-11-20    |

---
**Query #3**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    ROUND(
      SALARY - (SALARY * TAX_PERCENT/100)
      ) AS Net_salary ,
      YEAR(LAST_REVISION) AS Revsion_Year,
    TIMESTAMPDIFF(MONTH , LAST_REVISION, CURDATE()) AS Months_since_Lat_revision,
    CASE
    
    WHEN tax_percent > 20
    AND TIMESTAMPDIFF(
    MONTH,
    last_revision,
    CURDATE()
    ) > 24
    THEN 'Tax Shock'
    
    WHEN tax_percent BETWEEN 15 AND 20
    THEN 'Review Needed'
    
    ELSE 'Stable'
    
    END AS tax_status
    
    FROM salary_audit;

| EMP_NAME | Net_salary | Revsion_Year | Months_since_Lat_revision | tax_status    |
| -------- | ---------- | ------------ | ------------------------- | ------------- |
| karthik  | 67126      | 2022         | 52                        | Stable        |
| veena    | 53300      | 2023         | 35                        | Review Needed |
| ravi     | 63751      | 2020         | 65                        | Tax Shock     |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE bonus_monitor (
        emp_code INT,
        emp_name VARCHAR(50),
        base_salary DECIMAL(10,2),
        bonus DECIMAL(10,2),
        bonus_date DATE
    );
    
    INSERT INTO bonus_monitor VALUES
    (101,'Anil',70000.10,30000.00,'2025-01-10'),
    (102,'Suresh',60000.55,3000.30,'2024-03-15'),
    (103,'Ravi',85000.90,15000.75,'2023-12-01');

---

**Query #1**

    SHOW TABLES;

| Tables_in_test |
| -------------- |
| bonus_monitor  |

---
**Query #2**

    SELECT * FROM bonus_monitor;

| emp_code | emp_name | base_salary | bonus    | bonus_date |
| -------- | -------- | ----------- | -------- | ---------- |
| 101      | Anil     | 70000.1     | 30000.0  | 2025-01-10 |
| 102      | Suresh   | 60000.55    | 3000.3   | 2024-03-15 |
| 103      | Ravi     | 85000.9     | 15000.75 | 2023-12-01 |

---
**Query #3**

    SELECT 
    CONCAT(
    UPPER(LEFT(emp_name,1)),
    LOWER(SUBSTRING(emp_name,2))
    ) AS emp_name,
    ROUND(
      (BONUS/BASE_SALARY)*100) AS Bonus_percentage,
      DAYNAME(BONUS_DATE) AS Day,
      ABS(base_salary - bonus)
    AS salary_bonus_difference,
    CASE
    WHEN ((bonus/base_salary)*100) > 30
    AND DAYNAME(bonus_date)
    IN ('Saturday','Sunday')
    THEN 'Suspicious'
    WHEN ((bonus/base_salary)*100) <= 20
    THEN 'Normal'
    ELSE 'Audit'
    END AS bonus_status
    FROM bonus_monitor;

| emp_name | Bonus_percentage | Day    | salary_bonus_difference | bonus_status |
| -------- | ---------------- | ------ | ----------------------- | ------------ |
| Anil     | 43               | Friday | 40000.1                 | Audit        |
| Suresh   | 5                | Friday | 57000.25                | Normal       |
| Ravi     | 18               | Friday | 70000.15                | Normal       |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE employee_experience (
        emp_id INT,
        emp_name VARCHAR(50),
        joining_date DATE,
        declared_experience INT,
        salary DECIMAL(10,2)
    );
    
    INSERT INTO employee_experience VALUES
    (1,'Veena','2018-07-01',4,65000.40),
    (2,'Ravi','2014-01-10',12,85000.90),
    (3,'Anil','2020-09-01',3,70000.10);

---

**Query #1**

    SELECT * FROM employee_experience;

| emp_id | emp_name | joining_date | declared_experience | salary  |
| ------ | -------- | ------------ | ------------------- | ------- |
| 1      | Veena    | 2018-07-01   | 4                   | 65000.4 |
| 2      | Ravi     | 2014-01-10   | 12                  | 85000.9 |
| 3      | Anil     | 2020-09-01   | 3                   | 70000.1 |

---
**Query #2**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    TIMESTAMPDIFF(YEAR, JOINING_DATE , CURDATE()) AS Actual_Experience,
    ABS(DECLARED_EXPERIENCE - TIMESTAMPDIFF(YEAR, JOINING_DATE , CURDATE())) AS Experience_difference ,
    FLOOR(SALARY) AS Floored_salary,
    CASE
    WHEN declared_experience >
    TIMESTAMPDIFF(
    YEAR,
    joining_date,
    CURDATE()
    )
    THEN 'Overstated'
    WHEN declared_experience <
    TIMESTAMPDIFF(
    YEAR,
    joining_date,
    CURDATE()
    )
    THEN 'Understated'
    ELSE 'Matched'
    END AS experience_status
    
    FROM employee_experience;

| EMP_NAME | Actual_Experience | Experience_difference | Floored_salary | experience_status |
| -------- | ----------------- | --------------------- | -------------- | ----------------- |
| VEENA    | 7                 | 3                     | 65000          | Understated       |
| RAVI     | 12                | 0                     | 85000          | Matched           |
| ANIL     | 5                 | 2                     | 70000          | Understated       |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE salary_digits (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        credit_date DATE
    );
    
    INSERT INTO salary_digits VALUES
    (1,'Karthik',75000.75,'2025-01-01'),
    (2,'Veena',65000.40,'2025-01-02'),
    (3,'Suresh',60000.55,'2025-01-03');

---

**Query #1**

    SELECT * FROM salary_digits;

| emp_id | emp_name | salary   | credit_date |
| ------ | -------- | -------- | ----------- |
| 1      | Karthik  | 75000.75 | 2025-01-01  |
| 2      | Veena    | 65000.4  | 2025-01-02  |
| 3      | Suresh   | 60000.55 | 2025-01-03  |

---
**Query #2**

    SELECT 
    RIGHT(EMP_NAME , 2) AS Last_Two_char,
    DAY(CREDIT_DATE) AS Day,
    TRUNCATE(SALARY,0) AS Truncated_salary,
    MOD(TRUNCATE(SALARY,0),10) AS Salary_MOD,
    CASE
    WHEN MOD(TRUNCATE(salary,0),10)
    = DAY(credit_date)
    THEN 'Pattern Match'
    ELSE 'No Match'
    END AS pattern_status
    FROM salary_digits;

| Last_Two_char | Day | Truncated_salary | Salary_MOD | pattern_status |
| ------------- | --- | ---------------- | ---------- | -------------- |
| ik            | 1   | 75000            | 0          | No Match       |
| na            | 2   | 65000            | 0          | No Match       |
| sh            | 3   | 60000            | 0          | No Match       |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE payroll_control (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        payment_date DATE
    );
    
    INSERT INTO payroll_control VALUES
    (1,'Ravi',85000.90,'2025-01-15'),
    (2,'Anil',70000.10,'2025-01-16'),
    (3,'Veena',65000.40,'2025-01-17');

---

**Query #1**

    SELECT * FROM payroll_control;

| emp_id | emp_name | salary  | payment_date |
| ------ | -------- | ------- | ------------ |
| 1      | Ravi     | 85000.9 | 2025-01-15   |
| 2      | Anil     | 70000.1 | 2025-01-16   |
| 3      | Veena    | 65000.4 | 2025-01-17   |

---
**Query #2**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    DAYNAME(PAYMENT_DATE) AS Day,
    ROUND(SALARY) AS ROUNDED_SALARY,
    MOD(ROUND(SALARY),2) AS SALARY_MOD,
    CASE 
    WHEN MOD(ROUND(SALARY),2) = 0 AND DAY(PAYMENT_DAte) % 2 =1
    THEN 'Violation'
    ELSE 'Complaint'
    END AS Compliance_status
    FROM payroll_control;

| EMP_NAME | Day       | ROUNDED_SALARY | SALARY_MOD | Compliance_status |
| -------- | --------- | -------------- | ---------- | ----------------- |
| ravi     | Wednesday | 85001          | 1          | Complaint         |
| anil     | Thursday  | 70000          | 0          | Complaint         |
| veena    | Friday    | 65000          | 0          | Violation         |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE inflation_watch (
        product_id INT,
        product_name VARCHAR(50),
        old_price DECIMAL(10,2),
        new_price DECIMAL(10,2),
        update_date DATE
    );
    
    INSERT INTO inflation_watch VALUES
    (1,'Rice',1200.50,1450.75,'2025-01-10'),
    (2,'Oil',950.40,960.25,'2025-01-12'),
    (3,'Sugar',800.90,1100.60,'2025-01-15');

---

**Query #1**

    SELECT * FROM inflation_watch;

| product_id | product_name | old_price | new_price | update_date |
| ---------- | ------------ | --------- | --------- | ----------- |
| 1          | Rice         | 1200.5    | 1450.75   | 2025-01-10  |
| 2          | Oil          | 950.4     | 960.25    | 2025-01-12  |
| 3          | Sugar        | 800.9     | 1100.6    | 2025-01-15  |

---
**Query #2**

    SELECT 
    CONCAT(
      UPPER(LEFT(PRODUCT_NAME ,1)), 
      LOWER(SUBSTRING(PRODUCT_NAME,2))
      ) AS PRODUCT_NAME,
    (new_price -old_price) AS Increased_price,
    ROUND(
      ((new_price -old_price)/old_price)*100,2)
      AS Inflation_Percentage ,
      DAYNAME(UPDATE_DATE) AS Update_Day,
      
    CASE
    
    WHEN ((new_price - old_price)/old_price)*100 > 20
    THEN 'High Inflation'
    
    WHEN ((new_price - old_price)/old_price)*100
    BETWEEN 10 AND 20
    THEN 'Moderate'
    
    ELSE 'Stable'
    
    END AS inflation_status
    
    FROM inflation_watch;

| PRODUCT_NAME | Increased_price | Inflation_Percentage | Update_Day | inflation_status |
| ------------ | --------------- | -------------------- | ---------- | ---------------- |
| Rice         | 250.25          | 20.85                | Friday     | High Inflation   |
| Oil          | 9.85            | 1.04                 | Sunday     | Stable           |
| Sugar        | 299.7           | 37.42                | Wednesday  | High Inflation   |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE salary_integrity (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        bonus DECIMAL(10,2),
        salary_date DATE
    );
    
    INSERT INTO salary_integrity VALUES
    (1,'Ravi',85000.90,5000.25,'2025-01-01'),
    (2,'Anil',70000.10,NULL,'2025-01-02'),
    (3,'Veena',65000.40,4000.50,'2025-01-03');

---

**Query #1**

    SELECT * FROM salary_integrity;

| emp_id | emp_name | salary  | bonus   | salary_date |
| ------ | -------- | ------- | ------- | ----------- |
| 1      | Ravi     | 85000.9 | 5000.25 | 2025-01-01  |
| 2      | Anil     | 70000.1 |         | 2025-01-02  |
| 3      | Veena    | 65000.4 | 4000.5  | 2025-01-03  |

---
**Query #2**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    SALARY + IFNULL(BONUS,0) AS TOTAL_COMPENSATION ,
    IFNULL(BONUS,0) AS BONUS_AMOUNT,
    MONTHNAME(SALARY_DATE) AS Salary_Month,
    CASE
    
    WHEN bonus IS NULL
    THEN 'Missing Bonus'
    
    WHEN (salary + IFNULL(bonus,0)) > 90000
    THEN 'High Compensation'
    
    ELSE 'Standard'
    
    END AS compensation_status
    
    FROM salary_integrity;

| EMP_NAME | TOTAL_COMPENSATION | BONUS_AMOUNT | Salary_Month | compensation_status |
| -------- | ------------------ | ------------ | ------------ | ------------------- |
| RAVI     | 90001.15           | 5000.25      | January      | High Compensation   |
| ANIL     | 70000.1            | 0.0          | January      | Missing Bonus       |
| VEENA    | 69000.9            | 4000.5       | January      | Standard            |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE name_salary (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        joining_date DATE
    );
    
    INSERT INTO name_salary VALUES
    (1,'Karthik',75000.75,'2020-01-01'),
    (2,'Ravi',85000.90,'2019-05-15'),
    (3,'Veena',65000.40,'2021-08-10');

---

**Query #1**

    SELECT * FROM name_salary;

| emp_id | emp_name | salary   | joining_date |
| ------ | -------- | -------- | ------------ |
| 1      | Karthik  | 75000.75 | 2020-01-01   |
| 2      | Ravi     | 85000.9  | 2019-05-15   |
| 3      | Veena    | 65000.4  | 2021-08-10   |

---
**Query #2**

    SELECT 
    LEFT(EMP_NAME,3) AS FIRST_THREE_LETTERS,
    YEAR(JOINING_DATE) AS JOINING_YEAR,
    ROUND(SALARY) AS ROUNDED_SALARY,
    MOD(ROUND(SALARY),10) AS LAST_DIGIT_OF_SALARY,
    CASE WHEN MOD(ROUND(SALARY),10) = MOD(YEAR(JOINING_DATE),10) 
    THEN 'Encoded Match'
    ELSE 'EncodED Mismatch'
    END AS ENCODING_STATUS
    FROM  name_salary;

| FIRST_THREE_LETTERS | JOINING_YEAR | ROUNDED_SALARY | LAST_DIGIT_OF_SALARY | ENCODING_STATUS  |
| ------------------- | ------------ | -------------- | -------------------- | ---------------- |
| Kar                 | 2020         | 75001          | 1                    | EncodED Mismatch |
| Rav                 | 2019         | 85001          | 1                    | EncodED Mismatch |
| Vee                 | 2021         | 65000          | 0                    | EncodED Mismatch |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE salary_monthly (
        emp_id INT,
        emp_name VARCHAR(50),
        annual_salary DECIMAL(12,2),
        payment_month DATE
    );
    
    INSERT INTO salary_monthly VALUES
    (1,'Ravi',1200000.00,'2025-01-01'),
    (2,'Anil',840000.00,'2025-02-01'),
    (3,'Veena',600000.00,'2025-03-01');

---

**Query #1**

    SELECT * FROM salary_monthly;

| emp_id | emp_name | annual_salary | payment_month |
| ------ | -------- | ------------- | ------------- |
| 1      | Ravi     | 1200000.0     | 2025-01-01    |
| 2      | Anil     | 840000.0      | 2025-02-01    |
| 3      | Veena    | 600000.0      | 2025-03-01    |

---
**Query #2**

    SELECT 
    LOWER(EMP_NAME) AS EMP_NAME,
    ROUND(ANNUAL_SALARY/12,2) AS MONTHLY_SALARY,
    MONTHNAME(PAYMENT_MONTH) AS PAYMENT_MONTH,
    CEIL(ANNUAL_SALARY/12) AS CEILING_SALARY,
    CASE
    
    WHEN (annual_salary/12) >= 100000
    THEN 'Premium'
    
    WHEN (annual_salary/12)
    BETWEEN 50000 AND 99999
    THEN 'Mid Range'
    
    ELSE 'Basic'
    
    END AS salary_status
    
    FROM salary_monthly;

| EMP_NAME | MONTHLY_SALARY | PAYMENT_MONTH | CEILING_SALARY | salary_status |
| -------- | -------------- | ------------- | -------------- | ------------- |
| ravi     | 100000.0       | January       | 100000         | Premium       |
| anil     | 70000.0        | February      | 70000          | Mid Range     |
| veena    | 50000.0        | March         | 50000          | Mid Range     |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE digit_audit (
        emp_id INT,
        emp_name VARCHAR(50),
        salary DECIMAL(10,2),
        audit_date DATE
    );
    
    INSERT INTO digit_audit VALUES
    (1,'Karthik',75000.75,'2025-01-01'),
    (2,'Veena',65007.40,'2025-01-02'),
    (3,'Ravi',85009.90,'2025-01-03');

---

**Query #1**

    SELECT * FROM digit_audit;

| emp_id | emp_name | salary   | audit_date |
| ------ | -------- | -------- | ---------- |
| 1      | Karthik  | 75000.75 | 2025-01-01 |
| 2      | Veena    | 65007.4  | 2025-01-02 |
| 3      | Ravi     | 85009.9  | 2025-01-03 |

---
**Query #2**

    SELECT 
    CONCAT(
    UPPER(LEFT(emp_name,1)),
    LOWER(SUBSTRING(emp_name,2))
    ) AS emp_name,
    TRUNCATE(salary,0)
    AS truncated_salary,
    MOD(TRUNCATE(salary,0),10)
    AS last_salary_digit,
    DAY(audit_date)
    AS audit_day,
    CASE
    WHEN MOD(TRUNCATE(salary,0),10)
    = DAY(audit_date)
    THEN 'Digit Match'
    ELSE 'Digit Mismatch'
    END AS digit_status
    FROM digit_audit;

| emp_name | truncated_salary | last_salary_digit | audit_day | digit_status   |
| -------- | ---------------- | ----------------- | --------- | -------------- |
| Karthik  | 75000            | 0                 | 1         | Digit Mismatch |
| Veena    | 65007            | 7                 | 2         | Digit Mismatch |
| Ravi     | 85009            | 9                 | 3         | Digit Mismatch |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
**Schema (MySQL v8)**

    CREATE TABLE salary_credit_audit (
        emp_id INT,
        emp_name VARCHAR(50),
        expected_credit DATE,
        actual_credit DATE,
        salary DECIMAL(10,2)
    );
    
    INSERT INTO salary_credit_audit VALUES
    (1,'Ravi','2025-01-01','2025-01-03',85000.90),
    (2,'Veena','2025-01-01','2025-01-01',65000.40),
    (3,'Anil','2025-01-01','2025-01-08',70000.10);

---

**Query #1**

    SELECT * FROM salary_credit_audit;

| emp_id | emp_name | expected_credit | actual_credit | salary  |
| ------ | -------- | --------------- | ------------- | ------- |
| 1      | Ravi     | 2025-01-01      | 2025-01-03    | 85000.9 |
| 2      | Veena    | 2025-01-01      | 2025-01-01    | 65000.4 |
| 3      | Anil     | 2025-01-01      | 2025-01-08    | 70000.1 |

---
**Query #2**

    SELECT 
    UPPER(EMP_NAME) AS EMP_NAME,
    DATEDIFF(ACTUAL_CREDIT , EXPECTED_CREDIT) AS DELAY_DAYS,
    ROUND(salary)
    AS rounded_salary,
    DAYNAME(actual_credit)AS credit_day,
    CASE
    WHEN DATEDIFF(actual_credit,expected_credit) > 5
    THEN 'Severe Delay'
    WHEN DATEDIFF(actual_credit,expected_credit) BETWEEN 1 AND 5
    THEN 'Minor Delay'
    ELSE 'On Time'
    END AS delay_status
    FROM salary_credit_audit;

| EMP_NAME | DELAY_DAYS | rounded_salary | credit_day | delay_status |
| -------- | ---------- | -------------- | ---------- | ------------ |
| RAVI     | 2          | 85001          | Friday     | Minor Delay  |
| VEENA    | 0          | 65000          | Wednesday  | On Time      |
| ANIL     | 7          | 70000          | Wednesday  | Severe Delay |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/eSnxh3Wzd51GpaoxWrkZaL/4)
