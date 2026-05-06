**Query #1**

    SELECT * FROM Employee;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #2**

    SELECT name , salary FROM Employee;

| name        | salary  |
| ----------- | ------- |
| John Doe    | 50000.0 |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| Alice Blue  | 45000.0 |
| Charlie P.  | 50000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |
| Frank White | 48000.0 |
| Grace Kelly | 65000.0 |
| Hannah Lee  | 53000.0 |

---
**Query #3**

    SELECT * FROM Employee WHERE age > 30;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #4**

    SELECT name FROM Department;

| name      |
| --------- |
| IT        |
| HR        |
| Finance   |
| Marketing |

---
**Query #5**

    SELECT e.name FROM Employee e JOIN Department d ON e.department_id = d.department_id WHERE d.name="IT";

| name        |
| ----------- |
| John Doe    |
| Bob Brown   |
| Grace Kelly |

---
**Query #6**

    SELECT * FROM Employee WHERE name LIKE 'J%';

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |

---
**Query #7**

    SELECT * FROM Employee WHERE name LIKE '%e';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #8**

    SELECT * FROM Employee WHERE name LIKE '%a%';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #9**

    SELECT * FROM Employee WHERE LENGTH(name) = 9;

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |
| 7      | Eve Black | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #10**

    SELECT * FROM Employee WHERE name LIKE '_o%';

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe  | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #11**

    SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #12**

    SELECT * FROM Employee WHERE MONTH(hire_date) = 1;

| emp_id | name     | age | salary  | department_id | hire_date  |
| ------ | -------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe | 28  | 50000.0 | 1             | 2020-01-15 |

---
**Query #13**

    SELECT * FROM Employee WHERE YEAR(hire_date) < 2019;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #14**

    SELECT * FROM Employee WHERE hire_date = '2021-03-01';

There are no results to be displayed.

---
**Query #15**

    SELECT * FROM Employee WHERE hire_date >= DATE_SUB(CURDATE() , INTERVAL 2 YEAR);

There are no results to be displayed.

---
**Query #16**

    SELECT SUM(salary) AS TOTAL_SALARY FROM Employee ;

| TOTAL_SALARY |
| ------------ |
| 576000.0     |

---
**Query #17**

    SELECT AVG(salary) AS AVERAGE_SALARY FROM Employee;

| AVERAGE_SALARY |
| -------------- |
| 57600.0        |

---
**Query #18**

    SELECT MIN(salary) AS MINIMUM_SALARY FROM Employee;

| MINIMUM_SALARY |
| -------------- |
| 45000.0        |

---
**Query #19**

    SELECT MAX(salary) AS HIGHEST_SALARY FROM Employee;

| HIGHEST_SALARY |
| -------------- |
| 80000.0        |

---
**Query #20**

    SELECT department_id , AVG(salary) AS AVG_SALARY_IN_EACH_DEPT FROM Employee GROUP BY department_id;

| department_id | AVG_SALARY_IN_EACH_DEPT |
| ------------- | ----------------------- |
|               | 48000.0                 |
| 1             | 65000.0                 |
| 2             | 55000.0                 |
| 3             | 50000.0                 |
| 4             | 61500.0                 |

---
**Query #21**

    SELECT department_id, SUM(salary) AS TOTAL_SALARY_FOR_EACH_DEPT FROM Employee GROUP BY department_id;

| department_id | TOTAL_SALARY_FOR_EACH_DEPT |
| ------------- | -------------------------- |
|               | 48000.0                    |
| 1             | 195000.0                   |
| 2             | 110000.0                   |
| 3             | 100000.0                   |
| 4             | 123000.0                   |

---
**Query #22**

    SELECT department_id, AVG(age) AS AVG_AGE_IN_EACH_DEPT FROM Employee GROUP BY department_id;

| department_id | AVG_AGE_IN_EACH_DEPT |
| ------------- | -------------------- |
|               | 32.0                 |
| 1             | 33.3333              |
| 2             | 31.5                 |
| 3             | 32.5                 |
| 4             | 34.0                 |

---
**Query #23**

    SELECT YEAR(hire_date) AS HIRED_YEAR , COUNT(*) AS NO_OF_EMPLOYEES FROM Employee GROUP BY hire_date;

| HIRED_YEAR | NO_OF_EMPLOYEES |
| ---------- | --------------- |
| 2018       | 1               |
| 2018       | 1               |
| 2019       | 1               |
| 2019       | 1               |
| 2020       | 1               |
| 2020       | 1               |
| 2021       | 1               |
| 2021       | 1               |
| 2021       | 1               |
| 2022       | 1               |

---
**Query #24**

    SELECT department_id, MAX(salary) AS HIGHEST_SALARY FROM Employee GROUP BY department_id;

| department_id | HIGHEST_SALARY |
| ------------- | -------------- |
|               | 48000.0        |
| 1             | 80000.0        |
| 2             | 60000.0        |
| 3             | 55000.0        |
| 4             | 70000.0        |

---
**Query #25**

    SELECT d.name , AVG(e.salary) AS AVG_SALARY FROM Employee e JOIN Department d ON e.department_id = d.department_id GROUP BY d.name ORDER BY AVG_SALARY DESC LIMIT 1;

| name | AVG_SALARY |
| ---- | ---------- |
| IT   | 65000.0    |

---
**Query #26**

    -- 26
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) > 2;

| department_id | employee_count |
| ------------- | -------------- |
| 1             | 3              |

---
**Query #27**

    -- 27
    SELECT department_id, AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id
    HAVING AVG(salary) > 55000;

| department_id | average_salary |
| ------------- | -------------- |
| 1             | 65000.0        |
| 4             | 61500.0        |

---
**Query #28**

    -- 28
    SELECT department_id, SUM(salary) AS total_salary
    FROM Employee
    GROUP BY department_id
    HAVING SUM(salary) > 100000;

| department_id | total_salary |
| ------------- | ------------ |
| 1             | 195000.0     |
| 2             | 110000.0     |
| 4             | 123000.0     |

---
**Query #29**

    -- 29
    SELECT department_id, MAX(salary) AS max_salary
    FROM Employee
    GROUP BY department_id
    HAVING MAX(salary) > 70000;

| department_id | max_salary |
| ------------- | ---------- |
| 1             | 80000.0    |

---
**Query #30**

    -- 30
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) < 3;

| department_id | employee_count |
| ------------- | -------------- |
|               | 1              |
| 2             | 2              |
| 3             | 2              |
| 4             | 2              |

---
**Query #31**

    -- 31
    SELECT * FROM Employee ORDER BY salary ASC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #32**

    -- 32
    SELECT * FROM Employee ORDER BY salary DESC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

---
**Query #33**

    -- 33
    SELECT * FROM Employee ORDER BY age;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #34**

    -- 34
    SELECT * FROM Employee ORDER BY hire_date DESC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #35**

    -- 35
    SELECT * FROM Employee ORDER BY department_id, salary DESC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #36**

    -- 36
    SELECT e.name AS employee_name, d.name AS department_name
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id;

| employee_name | department_name |
| ------------- | --------------- |
| John Doe      | IT              |
| Bob Brown     | IT              |
| Grace Kelly   | IT              |
| Jane Smith    | HR              |
| Charlie P.    | HR              |
| Alice Blue    | Finance         |
| Eve Black     | Finance         |
| David Green   | Marketing       |
| Hannah Lee    | Marketing       |

---
**Query #37**

    -- 37
    SELECT e.name AS employee_name, p.name AS project_name
    FROM Employee e
    JOIN Project p
    ON e.department_id = p.department_id;

| employee_name | project_name    |
| ------------- | --------------- |
| John Doe      | Project Alpha   |
| Bob Brown     | Project Alpha   |
| Grace Kelly   | Project Alpha   |
| Jane Smith    | Project Beta    |
| Charlie P.    | Project Beta    |
| John Doe      | Project Gamma   |
| Bob Brown     | Project Gamma   |
| Grace Kelly   | Project Gamma   |
| Alice Blue    | Project Delta   |
| Eve Black     | Project Delta   |
| David Green   | Project Epsilon |
| Hannah Lee    | Project Epsilon |
| David Green   | Project Zeta    |
| Hannah Lee    | Project Zeta    |
| Alice Blue    | Project Eta     |
| Eve Black     | Project Eta     |
| John Doe      | Project Theta   |
| Bob Brown     | Project Theta   |
| Grace Kelly   | Project Theta   |

---
**Query #38**

    -- 38
    SELECT d.name AS department_name, e.name AS employee_name
    FROM Department d
    LEFT JOIN Employee e
    ON d.department_id = e.department_id;

| department_name | employee_name |
| --------------- | ------------- |
| IT              | John Doe      |
| IT              | Bob Brown     |
| IT              | Grace Kelly   |
| HR              | Jane Smith    |
| HR              | Charlie P.    |
| Finance         | Alice Blue    |
| Finance         | Eve Black     |
| Marketing       | David Green   |
| Marketing       | Hannah Lee    |

---
**Query #39**

    -- 39
    SELECT d.name AS department_name, p.name AS project_name
    FROM Department d
    LEFT JOIN Project p
    ON d.department_id = p.department_id;

| department_name | project_name    |
| --------------- | --------------- |
| IT              | Project Alpha   |
| IT              | Project Gamma   |
| IT              | Project Theta   |
| HR              | Project Beta    |
| Finance         | Project Delta   |
| Finance         | Project Eta     |
| Marketing       | Project Epsilon |
| Marketing       | Project Zeta    |

---
**Query #40**

    -- 40
    SELECT * FROM Employee WHERE department_id IS NULL;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #41**

    -- 41
    SELECT * FROM Project WHERE department_id IS NULL;

| project_id | name         | department_id |
| ---------- | ------------ | ------------- |
| 9          | Project Iota |               |

---
**Query #42**

    -- 42
    SELECT e.name, d.name
    FROM Employee e
    INNER JOIN Department d
    ON e.department_id = d.department_id;

| name        | name      |
| ----------- | --------- |
| John Doe    | IT        |
| Bob Brown   | IT        |
| Grace Kelly | IT        |
| Jane Smith  | HR        |
| Charlie P.  | HR        |
| Alice Blue  | Finance   |
| Eve Black   | Finance   |
| David Green | Marketing |
| Hannah Lee  | Marketing |

---
**Query #43**

    -- 43
    SELECT e.name, d.name
    FROM Employee e
    LEFT JOIN Department d
    ON e.department_id = d.department_id;

| name        | name      |
| ----------- | --------- |
| John Doe    | IT        |
| Bob Brown   | IT        |
| Grace Kelly | IT        |
| Jane Smith  | HR        |
| Charlie P.  | HR        |
| Alice Blue  | Finance   |
| Eve Black   | Finance   |
| David Green | Marketing |
| Hannah Lee  | Marketing |
| Frank White |           |

---
**Query #44**

    -- 44
    SELECT d.name, e.name
    FROM Department d
    LEFT JOIN Employee e
    ON d.department_id = e.department_id;

| name      | name        |
| --------- | ----------- |
| IT        | John Doe    |
| IT        | Bob Brown   |
| IT        | Grace Kelly |
| HR        | Jane Smith  |
| HR        | Charlie P.  |
| Finance   | Alice Blue  |
| Finance   | Eve Black   |
| Marketing | David Green |
| Marketing | Hannah Lee  |

---
**Query #45**

    -- 45
    SELECT e.name AS employee_name, p.name AS project_name
    FROM Employee e
    JOIN Project p
    ON e.department_id = p.department_id;

| employee_name | project_name    |
| ------------- | --------------- |
| John Doe      | Project Alpha   |
| Bob Brown     | Project Alpha   |
| Grace Kelly   | Project Alpha   |
| Jane Smith    | Project Beta    |
| Charlie P.    | Project Beta    |
| John Doe      | Project Gamma   |
| Bob Brown     | Project Gamma   |
| Grace Kelly   | Project Gamma   |
| Alice Blue    | Project Delta   |
| Eve Black     | Project Delta   |
| David Green   | Project Epsilon |
| Hannah Lee    | Project Epsilon |
| David Green   | Project Zeta    |
| Hannah Lee    | Project Zeta    |
| Alice Blue    | Project Eta     |
| Eve Black     | Project Eta     |
| John Doe      | Project Theta   |
| Bob Brown     | Project Theta   |
| Grace Kelly   | Project Theta   |

---
**Query #46**

    -- 46
    SELECT *
    FROM Employee
    WHERE salary > (SELECT AVG(salary) FROM Employee);

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #47**

    -- 47
    SELECT *
    FROM Employee
    WHERE salary = (SELECT MAX(salary) FROM Employee);

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #48**

    -- 48
    SELECT *
    FROM Employee
    WHERE salary = (SELECT MIN(salary) FROM Employee);

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue | 25  | 45000.0 | 3             | 2021-03-22 |

---
**Query #49**

    -- 49
    SELECT *
    FROM Employee
    WHERE department_id = (
        SELECT department_id FROM Department WHERE name = 'IT'
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #50**

    -- 50
    SELECT *
    FROM Employee
    WHERE department_id IN (
        SELECT department_id FROM Project
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #51**

    -- 51
    SELECT *
    FROM Department
    WHERE department_id IN (
        SELECT department_id FROM Employee WHERE salary > 60000
    );

| department_id | name      |
| ------------- | --------- |
| 1             | IT        |
| 4             | Marketing |

---
**Query #52**

    -- 52
    SELECT *
    FROM Employee
    WHERE hire_date < (
        SELECT AVG(hire_date) FROM Employee
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #53**

    -- 53
    SELECT *
    FROM Employee e1
    WHERE salary = (
        SELECT MAX(salary)
        FROM Employee e2
        WHERE e1.department_id = e2.department_id
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #54**

    -- 54
    SELECT *
    FROM Employee
    WHERE age > (SELECT AVG(age) FROM Employee);

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #55**

    -- 55
    SELECT *
    FROM Employee
    WHERE department_id IS NULL;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #56**

    -- 56
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employee
    GROUP BY department_id
    ORDER BY avg_salary DESC
    LIMIT 1;

| department_id | avg_salary |
| ------------- | ---------- |
| 1             | 65000.0    |

---
**Query #57**

    -- 57
    SELECT * FROM Employee ORDER BY age ASC LIMIT 1;

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue | 25  | 45000.0 | 3             | 2021-03-22 |

---
**Query #58**

    -- 58
    SELECT * FROM Employee ORDER BY age DESC LIMIT 1;

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #59**

    -- 59
    SELECT d.name, COUNT(p.project_id) AS project_count
    FROM Department d
    LEFT JOIN Project p
    ON d.department_id = p.department_id
    GROUP BY d.name;

| name      | project_count |
| --------- | ------------- |
| Finance   | 2             |
| HR        | 1             |
| IT        | 3             |
| Marketing | 2             |

---
**Query #60**

    -- 60
    SELECT *
    FROM Department
    WHERE department_id NOT IN (
        SELECT DISTINCT department_id FROM Employee WHERE department_id IS NOT NULL
    );

There are no results to be displayed.

---
**Query #61**

    -- 61
    SELECT MAX(salary) AS second_highest_salary
    FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee);

| second_highest_salary |
| --------------------- |
| 70000.0               |

---
**Query #62**

    -- 62
    SELECT * FROM Employee WHERE name LIKE '%e%';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #63**

    -- 63
    SELECT COUNT(*) AS total_employees
    FROM Employee
    WHERE YEAR(hire_date) > 2020;

| total_employees |
| --------------- |
| 4               |

---
**Query #64**

    -- 64
    SELECT d.name, COUNT(e.emp_id) AS employee_count
    FROM Department d
    LEFT JOIN Employee e
    ON d.department_id = e.department_id
    GROUP BY d.name;

| name      | employee_count |
| --------- | -------------- |
| Finance   | 2              |
| HR        | 2              |
| IT        | 3              |
| Marketing | 2              |

---
**Query #65**

    -- 65
    SELECT e.name AS employee_name, d.name AS department_name
    FROM Employee e
    LEFT JOIN Department d
    ON e.department_id = d.department_id;

| employee_name | department_name |
| ------------- | --------------- |
| John Doe      | IT              |
| Bob Brown     | IT              |
| Grace Kelly   | IT              |
| Jane Smith    | HR              |
| Charlie P.    | HR              |
| Alice Blue    | Finance         |
| Eve Black     | Finance         |
| David Green   | Marketing       |
| Hannah Lee    | Marketing       |
| Frank White   |                 |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/rUinoG5oYQMztvq1Z3sHg1/0)
