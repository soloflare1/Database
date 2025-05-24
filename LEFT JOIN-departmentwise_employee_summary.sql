/*
Join Type	Description
INNER JOIN-->	Only matching rows from both tables
LEFT JOIN-->	All rows from the left table, plus matched rows from right (or NULLs)
RIGHT JOIN-->	All rows from the right table, plus matched rows from left
*/


SELECT department_name, COUNT(*) AS no_employee
FROM departments 
LEFT JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_name;

/*
LEFT JOIN: Ensures all departments are shown, even if no employees are assigned.
COUNT(*): Counts the number of matching rows from the employees table per department.
          If you want to be extra accurate (especially to avoid counting NULL values from unmatched employees),
          you can change COUNT(*) to COUNT(employee_id):
GROUP BY department_name: Groups the results so the COUNT applies to each department separately.

---> ON departments.department_id = employees.department_id
This tells SQL how to match rows between the two tables:
It matches rows where the department_id in both tables is equal.
*/
