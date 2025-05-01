use `parks_and_recreation`;

#select all from table
select * from employee_demographics;

#select employee_id, first_name, age
select employee_id, first_name, age 
from employee_demographics;

# fetch gender from the table
select gender from employee_demographics; 

# <, >, <=, >=, != or <>, =

# Less than <
# Fetch employees record with age below 30
select * from employee_demographics
where age < 30;

# fetch employees records with age below 60
select * from employee_demographics
where age < 60;

# greater than >
# Fetch employee whose salary is above 50,000
select * from employee_salary
where salary > 50000;

# Fetch employees whose age is above 50
select * from employee_demographics
where age > 50;

# Less than equals to <=
# fetch employee records whose age is less than or equals 50
select * from employee_demographics
where age <= 50;

# Greater than equals to >=
# fetch employees whose salary is 100,000 above
select * from employee_salary
where salary >= 100000;

# equals to =
# fetch male employee gender
select * from employee_demographics
where gender = "male";

# not equals to != or <>
# fetch employees whose occupation is not an office manager
select * from employee_salary
where occupation != "office manager";

#fetch employees that are not male
select * from employee_demographics
where gender != "male";

# AND, OR, NOT

# AND 
# fetch employees whose age is above 20 and gender is a male
select * from employee_demographics
where age > 20 and gender <> "female";

# fetch employees record of people whose occupation is office manager and salary is above 30000
select * from employee_salary
where occupation = "office manager" and salary > 30000;

# OR 
# fetch employee whose gender are females or age is 30 and above
select * from employee_demographics
where gender = "female" or age >= 30;

# NOT
# fetch employees that are not male and age is below 50
select * from employee_demographics
where not gender =  "male" and age < 50;





