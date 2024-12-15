-- Write a query to list all employees who work in the IT department.
select * from employees  where department='IT'

-- Retrieve the names of employees who joined after January 1, 2020.
select name,joindate from employees where joindate>'2020-01-01';

-- Task 4: Calculate Total Budget by Department
select department,sum(budget) as total_budget from projects group by  department order by total_budget

-- Task 5: List Employees with a Salary Above the Average
select * from employees
select  name, avg(salary) as avg_salary from employees where salary > (select avg(salary) 
from employees)   group by name

-- : Find Departments Without Projects
select distinct department from employees where department not in
(select distinct department from projects)

-- : Add a Column for Performance Rating
alter table  employees add column  performance_rating int8;
-- 
--  HR employees: Rating = 4
--  IT employees: Rating = 5
UPDATE employees
SET performance_rating = CASE
    WHEN department = 'HR' THEN 4
    WHEN department = 'IT' THEN 5
END
 -- to show the  all column which department is hr and it

select * from employees WHERE department IN ('HR', 'IT');

 -- Display Employees and Their Project Details
 select e.name,e.department,p.projectname,p.budget from employees as e 
 left join projects as p on e.department =p.department;

 
