-- *3rd distinct highest salary *

-- Query 1: Using DISTINCT + ORDER BY + LIMIT

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- *Explanation:
-- *ORDER BY salary DESC: sorts salaries from highest to lowest.
-- *DISTINCT: removes duplicates.
-- *LIMIT 1 OFFSET 2: skips the top 2 and returns the 3rd one.


-- Query 2: Using Nested MAX()

SELECT MAX(salary)
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
    WHERE salary < 
    (
        SELECT MAX(salary)
        FROM employees
    )
);

-- *Explanation:
-- *SELECT MAX(salary) FROM employees → finds the highest salary.
-- *Inner query: WHERE salary < (highest) → finds the second highest.
-- *Outer query: WHERE salary < (second highest) → finds the third highest.

-- both Query 1 & 2 output:
Salaries: 9000, 9000, 8500, 8000
output: 8000 

