-- 1
SELECT * FROM Employee;

-- 2
SELECT name, salary FROM Employee;

-- 3
SELECT * FROM Employee WHERE age > 30;

-- 4
SELECT name FROM Department;

-- 5
SELECT e.name 
FROM Employee e 
JOIN Department d 
ON e.department_id = d.department_id 
WHERE d.name = "IT";

-- 6
SELECT * FROM Employee WHERE name LIKE 'J%';

-- 7
SELECT * FROM Employee WHERE name LIKE '%e';

-- 8
SELECT * FROM Employee WHERE name LIKE '%a%';

-- 9
SELECT * FROM Employee WHERE LENGTH(name) = 9;

-- 10
SELECT * FROM Employee WHERE name LIKE '_o%';

-- 11
SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;

-- 12
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;

-- 13
SELECT * FROM Employee WHERE YEAR(hire_date) < 2019;

-- 14
SELECT * FROM Employee WHERE hire_date = '2021-03-01';

-- 15
SELECT * 
FROM Employee 
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 16
SELECT SUM(salary) AS TOTAL_SALARY FROM Employee;

-- 17
SELECT AVG(salary) AS AVERAGE_SALARY FROM Employee;

-- 18
SELECT MIN(salary) AS MINIMUM_SALARY FROM Employee;

-- 19
SELECT MAX(salary) AS HIGHEST_SALARY FROM Employee;

-- 20
SELECT department_id, AVG(salary) AS AVG_SALARY_IN_EACH_DEPT 
FROM Employee 
GROUP BY department_id;

-- 21
SELECT department_id, SUM(salary) AS TOTAL_SALARY_FOR_EACH_DEPT 
FROM Employee 
GROUP BY department_id;

-- 22
SELECT department_id, AVG(age) AS AVG_AGE_IN_EACH_DEPT 
FROM Employee 
GROUP BY department_id;

-- 23
SELECT YEAR(hire_date) AS HIRED_YEAR, COUNT(*) AS NO_OF_EMPLOYEES 
FROM Employee 
GROUP BY hire_date;

-- 24
SELECT department_id, MAX(salary) AS HIGHEST_SALARY 
FROM Employee 
GROUP BY department_id;

-- 25
SELECT d.name, AVG(e.salary) AS AVG_SALARY 
FROM Employee e 
JOIN Department d 
ON e.department_id = d.department_id 
GROUP BY d.name 
ORDER BY AVG_SALARY DESC 
LIMIT 1;

-- 26
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) > 100000;

-- 29
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 70000;

-- 30
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) < 3;

-- 31
SELECT * FROM Employee ORDER BY salary ASC;

-- 32
SELECT * FROM Employee ORDER BY salary DESC;

-- 33
SELECT * FROM Employee ORDER BY age;

-- 34
SELECT * FROM Employee ORDER BY hire_date DESC;

-- 35
SELECT * FROM Employee ORDER BY department_id, salary DESC;

-- 36
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- 37
SELECT e.name AS employee_name, p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- 38
SELECT d.name AS department_name, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- 39
SELECT d.name AS department_name, p.name AS project_name
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id;

-- 40
SELECT * FROM Employee WHERE department_id IS NULL;

-- 41
SELECT * FROM Project WHERE department_id IS NULL;

-- 42
SELECT e.name, d.name
FROM Employee e
INNER JOIN Department d
ON e.department_id = d.department_id;

-- 43
SELECT e.name, d.name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- 44
SELECT d.name, e.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- 45
SELECT e.name AS employee_name, p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- 46
SELECT *
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 47
SELECT *
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- 48
SELECT *
FROM Employee
WHERE salary = (SELECT MIN(salary) FROM Employee);

-- 49
SELECT *
FROM Employee
WHERE department_id = (
    SELECT department_id FROM Department WHERE name = 'IT'
);

-- 50
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id FROM Project
);

-- 51
SELECT *
FROM Department
WHERE department_id IN (
    SELECT department_id FROM Employee WHERE salary > 60000
);

-- 52
SELECT *
FROM Employee
WHERE hire_date < (
    SELECT AVG(hire_date) FROM Employee
);

-- 53
SELECT *
FROM Employee e1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

-- 54
SELECT *
FROM Employee
WHERE age > (SELECT AVG(age) FROM Employee);

-- 55
SELECT *
FROM Employee
WHERE department_id IS NULL;

-- 56
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- 57
SELECT * FROM Employee ORDER BY age ASC LIMIT 1;

-- 58
SELECT * FROM Employee ORDER BY age DESC LIMIT 1;

-- 59
SELECT d.name, COUNT(p.project_id) AS project_count
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.name;

-- 60
SELECT *
FROM Department
WHERE department_id NOT IN (
    SELECT DISTINCT department_id FROM Employee WHERE department_id IS NOT NULL
);

-- 61
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- 62
SELECT * FROM Employee WHERE name LIKE '%e%';

-- 63
SELECT COUNT(*) AS total_employees
FROM Employee
WHERE YEAR(hire_date) > 2020;

-- 64
SELECT d.name, COUNT(e.emp_id) AS employee_count
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name;

-- 65
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;
