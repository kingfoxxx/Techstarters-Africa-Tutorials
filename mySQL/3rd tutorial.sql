# JOINS is the joining of two or more tables

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics;

# inner joins return columns that are the same in both tables
SELECT *
FROM employee_demographics
INNER JOIN  employee_salary 
	ON employee_demographics.employee_id = employee_salary.employee_id
;
SELECT *
FROM employee_demographics AS dem
INNER JOIN  employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN  employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# OUTER JOINS: left outer or right outer joins
# our emplyee_demographics table is our left joins while the employee_salary table is the right joins
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
RIGHT JOIN  employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN  employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# Sel Join: ties the table to its self
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
    ;
    
    # Joining multiple tables together
    
    SELECT *
    FROM parks_departments;
    
    SELECT *
FROM employee_demographics AS dem
INNER JOIN  employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
		ON sal.dept_id = pd.department_id
;

# UNIONS: allows you combine the roles of data 

SELECT first_name, last_name
FROM  employee_demographics
UNION ALL
# UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 30 AND gender = 'Male'
UNION 
SELECT first_name, last_name, 'Old Lady' AS Label 
FROM employee_demographics
WHERE age > 40 AND gender ='Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label 
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;

