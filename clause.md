# 📚 SQL Clauses —

In SQL, a **clause** is a keyword or phrase that defines a part of a query. Clauses are used to build powerful and flexible queries by specifying what data to fetch, how to filter it, sort it, group it, and more.

---

## ✅ What is a Clause?

A **clause** in SQL is a **component** of a query that performs a specific task — like selecting data, filtering results, or grouping rows.

### 📌 Examples of Common SQL Clauses:

| Clause       | Purpose                                 |
|--------------|------------------------------------------|
| `SELECT`     | Choose which columns to display          |
| `FROM`       | Specify the table to get data from       |
| `WHERE`      | Filter rows based on conditions          |
| `GROUP BY`   | Group rows that have the same values     |
| `HAVING`     | Filter groups after aggregation          |
| `ORDER BY`   | Sort the result set                      |
| `LIMIT`      | Limit the number of rows returned        |
| `OFFSET`     | Skip a number of rows before returning   |

---

## ❓ Why are Clauses Important?

Clauses help you:

- Narrow down the data you need
- Improve performance by filtering early
- Apply logic (like grouping or sorting)
- Build readable and maintainable queries

---

## 🛠️ How Clauses Work Together

Example: Fetch names of students from **Delhi** with marks over **80**, sorted by marks:

```sql
SELECT name, marks
FROM students
WHERE city = 'Delhi' AND marks > 80
ORDER BY marks DESC;


### ⚙️ 4. **Query Execution**

```sql
SELECT name, COUNT(*) 
FROM users 
WHERE status = 'active' 
GROUP BY name 
HAVING COUNT(*) > 5 
ORDER BY COUNT(*) DESC 
LIMIT 10 OFFSET 5;
```

The engine starts executing in the following order:

> Even though you write:

```sql
SELECT ... FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY ... LIMIT ...
```

➡️ MySQL *actually processes* in this internal logical order:

`FROM` ---> `WHERE` --> `GROUP BY` --> `HAVING` --> `SELECT` --> `ORDER BY` --> `LIMIT/OFFSET`

| Step | Clause         | What Happens                                    |
| ---- | -------------- | ----------------------------------------------- |
| 1    | `FROM`         | Load data from table(s)                         |
| 2    | `WHERE`        | Filter rows                                     |
| 3    | `GROUP BY`     | Group rows based on column(s)                   |
| 4    | Aggregates     | Run aggregate functions like `SUM()`, `COUNT()` |
| 5    | `HAVING`       | Filter grouped results                          |
| 6    | `SELECT`       | Return final columns                            |
| 7    | `ORDER BY`     | Sort the results                                |
| 8    | `LIMIT/OFFSET` | Trim result set                                 |

---