-- *first names of employees earning above the company’s average salary

select first_name
from employees
where salary >
(
    select avg(salary)
    from employees
);
