-- 1
SELECT * FROM Employees;

-- 2
SELECT emp_name, salary FROM Employees;

-- 3
SELECT emp_name, department FROM Employees;

-- 4
SELECT * FROM Employees WHERE department = 'IT';

-- 5
SELECT emp_name, experience FROM Employees;

-- 6
SELECT * FROM Employees WHERE salary > 70000;

-- 7
SELECT * FROM Employees WHERE city = 'Hyderabad';

-- 8
SELECT * FROM Employees WHERE experience < 4;

-- 9
SELECT * FROM Employees WHERE department = 'Finance';

-- 10
SELECT * FROM Employees WHERE salary = 52000;

-- 11
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

-- 12
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;

-- 13
SELECT city, COUNT(*) AS total_employees
FROM Employees
GROUP BY city;

-- 14
SELECT department, MAX(salary) AS highest_paid_salary
FROM Employees
GROUP BY department;

-- 15
SELECT department, MIN(experience) AS min_experience
FROM Employees
GROUP BY department;

-- 16
SELECT department, COUNT(*) AS no_of_employees
FROM Employees
GROUP BY department
HAVING COUNT(*) > 3;

-- 17
SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 18
SELECT city, COUNT(*) AS no_of_employees
FROM Employees
GROUP BY city
HAVING COUNT(*) > 2;

-- 19
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;

-- 20
SELECT department, MAX(salary) AS maximum_salary
FROM Employees
GROUP BY department
HAVING MAX(salary) > 90000;

-- 21
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- 22
SELECT * FROM Employees
ORDER BY experience DESC
LIMIT 3;

-- 23
SELECT department, emp_name, salary
FROM Employees
WHERE department = 'Finance'
ORDER BY salary DESC
LIMIT 2;

-- 24
SELECT * FROM Employees
WHERE city = 'Hyderabad'
ORDER BY salary DESC
LIMIT 4;

-- 25
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 1;

-- 26
SELECT DISTINCT department FROM Employees;

-- 27
SELECT DISTINCT city FROM Employees;

-- 28
SELECT DISTINCT salary FROM Employees;

-- 29
SELECT DISTINCT department, city FROM Employees;

-- 30
SELECT DISTINCT experience FROM Employees;

-- 31
SELECT * FROM Employees WHERE salary >= 80000;

-- 32
SELECT * FROM Employees WHERE experience <= 3;

-- 33
SELECT * FROM Employees WHERE salary <> 45000;

-- 34
SELECT * FROM Employees WHERE salary < 50000;

-- 35
SELECT * FROM Employees WHERE experience > 5;

-- 36
SELECT * FROM Employees
WHERE department = 'IT'
AND salary > 70000;

-- 37
SELECT * FROM Employees
WHERE city = 'Hyderabad'
   OR city = 'Bangalore';

-- 38
SELECT * FROM Employees
WHERE department = 'HR'
AND experience < 3;

-- 39
SELECT * FROM Employees
WHERE salary > 60000
   OR experience > 6;

-- 40
SELECT * FROM Employees
WHERE department <> 'Sales';

-- 41
SELECT * FROM Employees
WHERE city IN ('Hyderabad', 'Mumbai');

-- 42
SELECT * FROM Employees
WHERE department IN ('IT', 'Finance');

-- 43
SELECT * FROM Employees
WHERE city NOT IN ('Chennai', 'Pune');

-- 44
SELECT * FROM Employees
WHERE salary IN (45000, 75000, 91000);

-- 45
SELECT * FROM Employees
WHERE department NOT IN ('HR', 'Sales');

-- 46
SELECT * FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

-- 47
SELECT * FROM Employees
WHERE experience BETWEEN 3 AND 6;

-- 48
SELECT * FROM Employees
WHERE emp_id BETWEEN 105 AND 112;

-- 49
SELECT * FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000;

-- 50
SELECT * FROM Employees
WHERE experience BETWEEN 2 AND 4;

-- 51
SELECT * FROM Employees
WHERE emp_name LIKE 'R%';

-- 52
SELECT * FROM Employees
WHERE emp_name LIKE '%a';

-- 53
SELECT * FROM Employees
WHERE emp_name LIKE '%v%';

-- 54
SELECT * FROM Employees
WHERE city LIKE 'B%';

-- 55
SELECT * FROM Employees
WHERE department LIKE '%s';
