# WHERE ClAUSE: Filters Record

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender !=  'Female';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender =  'Female';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date <  '1985-01-01';

#Logical Operators: they allow us have different logic in the where clause; AND says both conditions have to be true
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' 
AND gender =  'male';

# OR Logic says one 'either one has to be true' condition from the record is 
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' 
OR NOT gender =  'male';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE(first_name = 'Tom' AND age = 36) OR age > 55;

# LIKE 
# % and
SELECT *
FROM parks_and_recreation.employee_demographics
# WHERE first_name LIKE 'jer%'
# WHERE first_name LIKE '%a%'
#WHERE first_name LIKE 'a__%'
WHERE birth_date LIKE '1989%'
;
# Group By: same values
SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary;

# ORDER BY: sorts result set by ascending or descending order


SELECT *
FROM employee_demographics
ORDER BY first_name ASC
# we could also use DESC
;

SELECT * 
FROM  employee_demographics
order by gender, age DESC;


