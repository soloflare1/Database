/*
Illustrate INNER JOIN, LEFT JOIN, RIGHT JOIN, and CROSS JOIN with 
examples using the employees and departments tables.

INNER JOIN: shows employees who have managers and their manager’s name.
LEFT JOIN: shows all departments, with city names where available.
RIGHT JOIN: shows all cities, with departments located there if any.
CROSS JOIN: gives every possible pair of department and city.
*/

-- INNER JOIN: Employees and their managers
SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees AS e
INNER JOIN employees AS m
  ON e.manager_id = m.employee_id;

-- LEFT JOIN: All departments and their city (if any)
SELECT d.department_name, l.city
FROM departments AS d
LEFT JOIN locations AS l
  ON d.location_id = l.location_id;

-- RIGHT JOIN: All cities and the departments in them (if any)
SELECT d.department_name, l.city
FROM departments AS d
RIGHT JOIN locations AS l
  ON d.location_id = l.location_id;

-- CROSS JOIN: Every combination of department and city
SELECT d.department_name, l.city
FROM departments AS d
CROSS JOIN locations AS l;




/*
INNER JOIN: Returns only rows with matching values in both tables.
Example: Employees who have managers.

LEFT JOIN: Returns all rows from the left table, plus matched rows from the right table. Null if no match.
Example: All departments with city info (if available).

RIGHT JOIN: Returns all rows from the right table, plus matched rows from the left table. Null if no match.
Example: All cities and departments in those cities (if any).

CROSS JOIN: Returns the Cartesian product of both tables (all possible combinations).
Example: Every department paired with every city.

*/
