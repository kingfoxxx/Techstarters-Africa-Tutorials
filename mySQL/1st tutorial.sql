SELECT * 
FROM  parks_and_recreation.employee_demographics;

SELECT first_name, last_name, birth_date, age, (age +10) * 10 + 10 
FROM  parks_and_recreation.employee_demographics;
#PEMDAS

#DISTINCT: Distinguishes records
SELECT DISTINCT first_name, gender
FROM  parks_and_recreation.employee_demographics;

# Diff btw Having vs Where
SELECT gender, avg(age)
FROM employee_demographics
GROUP BY gender
HAVING avg(age) > 40
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;

# Limit & Aliasing

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

# Aliasing is a way to change column names and used with joins
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
group by gender
HAVING avg_age > 40;