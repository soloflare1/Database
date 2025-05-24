-- *Write a query to display the names of employees who earn a salary less than the employee "Steven King".*


select first_name
from employees
where salary <
(
    select salary
  	from employees
    where 
        first_name = 'Steven' 
		    and last_name = 'King'
);

-- in SQL
-- Use = for equality in SQL.
-- Use AND to combine conditions.

-- or
select first_name
from employees
where salary <
(
    select salary
  	from employees
    where first_name = 'Steven' and last_name = 'King'
);
