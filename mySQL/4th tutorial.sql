# String Functions

SELECT length('BRIGHT');

SELECT UPPER('BRIGHT');
SELECT lower('BRIGHT');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

SELECT trim('      sky    ');

SELECT first_name, left(first_name, 4)
FROM employee_demographics;


SELECT locate('r', 'Bright');

SELECT first_name, last_name,
# concat helps combine multiple columns to one 
concat(first_name, ' ',last_name)
FROM employee_demographics;


# Case Statement: it allows you add logic in your select statement
SELECT first_name,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age  BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 51 THEN 'Super Old'
END
FROM employee_demographics;


# pay increase and bonus
# < 50000 = 5%
# > 50000 = 7%

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 then salary * 1.05
    WHEN salary > 50000 then salary * 1.07
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN  salary * .10
    END AS Bonus
FROM  employee_salary;



# Subqueries

SELECT *
FROM employee_demographics
WHERE employee_id IN 
					(SELECT employee_id
                    FROM employee_salary
                    where dept_id = 1
);

SELECT  AVG(`max(age)`)
FROM
(SELECT gender, avg(age), max(age), min(age), count(age)
from employee_demographics
GROUP BY gender) AS Agg_table
;

# window Function

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM  employee_demographics dem
JOIN employee_salary sal
	ON  dem.employee_id = sal.employee_id;
    

SELECT dem.first_name, dem.last_name, gender, salary, 
sum(salary) OVER(PARTITION BY gender)
FROM  employee_demographics dem
JOIN employee_salary sal
	ON  dem.employee_id = sal.employee_id;

# rolling column
SELECT dem.first_name, dem.last_name, gender, salary, 
sum(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS  Rolling_Total
FROM  employee_demographics dem
JOIN employee_salary sal
	ON  dem.employee_id = sal.employee_id;

