/*  *CTE-> A CTE is like saving a query's result into a temporary named variable, 
          so you can use it later in the same SQL statement.

  * A Common Table Expression (CTE) is like a temporary table you create inside your query.
       You use it to make your SQL easier to read and organize.
*/
-- Syntax
WITH <Variable Name> AS
(
    <Query>
)
/*
  
It's temporary:
Only exists while the query runs.
Not saved in the database.
*/

  
-- for example
-- *  Write an example query using CTE to show the names of employees whose salary is higher than the average salary.
-- CTE part:
with CTE_avg_salary as 
(
    select avg(salary) as avg_salary
    from employees
)
-- Main query:
select first_name,last_name
from employees
where salary >
(
     select avg_salary
     from CTE_avg_salary
);

--  AS avg_salary:
 avg_salary is the column name you can use in your main query.
 AS avg_salary is needed if you want to use that value later.
It gives a name to the average salary column inside the CTE.
You need that name to refer to it later in the main query.
-- CTE part:
Calculates the average salary of all employees.
Names the result avg_salary and stores it in the temporary CTE CTE_avg_salary.
-- Main query:
Selects the first and last names of employees whose salary is greater than the average.
