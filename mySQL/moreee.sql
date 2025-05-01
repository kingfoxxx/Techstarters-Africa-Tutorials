-- SELECT * FROM employee_demographics;
-- SELECT * FROM employee_salary;

# Remove a column(s) from a table
# remove first_name and last_name columns fron employee_salary
alter table employee_salary
drop column first_name,
drop column last_name;

SELECT * FROM employee_salary;
SELECT * FROM employee_demographics;

# what is the average salary of the male gender
# with left join

select avg(sal.salary) from employee_demographics dem
left join employee_salary sal
on dem.employee_id = sal.employee_id
where dem.gender = "male";

# SUBQUERY
# what is the average salary of the male gender
select avg(salary) from employee_salary
where employee_id in (
select employee_id from employee_demographics where gender = "male"
);

# Average salary based on gender
select dem.gender, avg(sal.salary) average_salary from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender;

# using subquery
SELECT 
    gender, 
    AVG((
        SELECT salary 
        FROM employee_salary sal 
        WHERE sal.employee_id = dem.employee_id
    )) AS average_salary
FROM employee_demographics dem
GROUP BY gender;

# average salary by gender
select * from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select gender, avg(salary) from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id
group by gender;




# WINDOWS FUNCTION ROW_NUMBER, RANK, DENSE RANK
select gender, avg(salary) over(partition by gender)
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

# Running total salary based on gender
select dem.employee_id, gender, salary, sum(salary) over(partition by gender order by dem.employee_id) running_total
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

# row numbers
select dem.employee_id, gender, salary,
row_number() over() from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select dem.employee_id, gender, salary,
row_number() over() from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select dem.employee_id, gender, salary,
row_number() over(partition by gender order by salary desc) 
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

# rank
select dem.employee_id, gender, salary,
rank() over() ranking
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select dem.employee_id, gender, salary,
row_number() over(order by salary desc) row_num,
rank() over(order by salary desc) ranking
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

# Dense Rank
select dem.employee_id, gender, salary,
row_number() over(order by salary desc) row_num,
rank() over(order by salary desc) ranking,
dense_rank() over(order by salary desc) dense_rank_num
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;


