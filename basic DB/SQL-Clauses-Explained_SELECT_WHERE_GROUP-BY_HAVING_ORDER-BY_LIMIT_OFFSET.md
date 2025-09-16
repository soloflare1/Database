### ✅ SELECT, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT, OFFSET

---
## ✅ 1. `SELECT` — **What to show**
### Purpose:

* It specifies **what columns or calculated values** you want to fetch from a table.

### 🔹Syntax:
```sql
SELECT column1, column2, ...
FROM table_name;
```

### 🔹 Notes:
* You can also use expressions: `SELECT marks + 5 FROM students;`
* You can use aliases: `SELECT name AS student_name FROM students;`

### 🔹 Why:
* You **don't always need all data**.
* Want only `name`, or maybe calculate `marks * 0.1` as bonus, etc.

### 🔹Common Mistake:

* Writing column names that don’t exist or typos like `SELECT Names` instead of `name`.

---

## ✅ 2. `WHERE` — **Filter rows (records)**

### 🔹 Purpose:

* It filters **rows** **before** any grouping or aggregation happens.

### 🔹 Syntax:

```sql
SELECT * FROM students WHERE marks > 80;
```

### 🔹Supported Operators:

* `=`, `!=`, `<`, `>`, `<=`, `>=`, `BETWEEN`, `LIKE`, `IN`, `IS NULL`, etc.

### 🔹 Why:

* To get only **specific** data — like top scorers, students from Mumbai, etc.

### 🔹 Notes:

* `WHERE` comes **before GROUP BY**.
* Cannot use aggregate functions here (e.g., `WHERE AVG(marks) > 80 ❌`).

---

## ✅ 3. `GROUP BY` — **Group similar rows**

### 🔹 Purpose:

* It groups rows based on one or more columns, so we can apply **aggregate functions** to each group.

### 🔹 Syntax:

```sql
SELECT city, COUNT(*) FROM students GROUP BY city;
```

### 🔹 Why:

* You want **summarized info**, like:

  * Count of students per city
  * Average marks per grade
  * Highest marks per city

### 🔹 Supported Aggregates:

* `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`

### 🔹 Notes:

* All columns in SELECT **must be either grouped or aggregated**.

### 🔹 Common Mistake:

```sql
SELECT name, COUNT(*) FROM students GROUP BY city; ❌
```

> `name` is not grouped or aggregated → SQL error.

---

## ✅ 4. `HAVING` — **Filter groups (not rows)**

### 🔹 Purpose:

* `HAVING` filters **groups** created by `GROUP BY`.

### 🔹 Syntax:

```sql
SELECT city, COUNT(*) FROM students
GROUP BY city
HAVING COUNT(*) > 1;
```

### 🔹 Why:

* You want only the groups that meet a condition:

  * Cities with more than 2 students
  * Grades where average marks are over 80

### 🔹 Key Difference:

| Clause | Filters What? |
| ------ | ------------- |
| WHERE  | Rows          |
| HAVING | Groups        |

### 🔹 Common Mistake:

```sql
SELECT city FROM students HAVING marks > 90; ❌
```

> Use `WHERE` if you're not grouping.

---

## ✅ 5. `ORDER BY` — **Sort the output**

### 🔹 Purpose:

* To **sort rows** by one or more columns, in ascending (`ASC`) or descending (`DESC`) order.

### 🔹 Syntax:

```sql
SELECT * FROM students ORDER BY marks DESC;
```

### 🔹 Why:

* Show top performers, oldest users, latest transactions, etc.

### 🔹 Notes:

* Default is `ASC` (A-Z or smallest to largest).
* Can sort by multiple columns:

```sql
ORDER BY grade ASC, marks DESC;
```

---

## ✅ 6. `LIMIT` — **Limit the number of rows**

### 🔹 Purpose:

* Restrict the number of rows in result — useful in **pagination** or top-N queries.

### 🔹 Syntax:

```sql
SELECT * FROM students LIMIT 3;
```

### 🔹 Why:

* For performance (especially on large datasets).
* Show only top 5 records, or preview small sets.

### 🔹 Notes:

* Works **after all filtering and ordering** is done.

---

## ✅ 7. `OFFSET` — **Skip rows**

### 🔹 Purpose:

* Skips a number of rows **before** returning the `LIMIT`ed results.

### 🔹 Syntax:

```sql
SELECT * FROM students ORDER BY marks DESC LIMIT 3 OFFSET 2;
```

### 🔹 Why:

* Used in **pagination**, e.g., "Show next 5 results".

### 🔹 Example:

If you have this ordering:

| Name    | Marks |
| ------- | ----- |
| Dhruv   | 96    |
| Bhumika | 93    |
| Chetan  | 85    |
| Farah   | 82    |
| Anil    | 78    |
| Emanuel | 12    |

Then:

```sql
LIMIT 3 OFFSET 2
```

➡️ Returns: Chetan, Farah, Anil

---

## 🔁 How They Work Together – Execution Order

| Step | Clause         | Purpose                                     |
| ---- | -------------- | ------------------------------------------- |
| 1️⃣  | `FROM`         | Get data from table                         |
| 2️⃣  | `WHERE`        | Filter rows                                 |
| 3️⃣  | `GROUP BY`     | Group the filtered rows                     |
| 4️⃣  | `HAVING`       | Filter the grouped results                  |
| 5️⃣  | `SELECT`       | Pick columns or expressions                 |
| 6️⃣  | `ORDER BY`     | Sort the final result                       |
| 7️⃣  | `LIMIT/OFFSET` | Return specific number of rows (pagination) |

---

## ✅ Example 

**Q: Show top 2 cities (that have more than 1 student), based on average marks of students, in descending order**

```sql
SELECT city, AVG(marks) AS avg_marks, COUNT(*) AS student_count
FROM students
WHERE marks > 50
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY avg_marks DESC
LIMIT 2;
```

### ✅ Explanation:

* `WHERE marks > 50` → keep students with >50 marks
* `GROUP BY city` → group by city
* `HAVING COUNT(*) > 1` → keep only cities with more than 1 such student
* `ORDER BY avg_marks DESC` → sort by average marks
* `LIMIT 2` → show top 2 cities

---

##

| Task                       | Clause     |
| -------------------------- | ---------- |
| Choose what to show        | `SELECT`   |
| Filter rows                | `WHERE`    |
| Group similar data         | `GROUP BY` |
| Filter grouped data        | `HAVING`   |
| Sort results               | `ORDER BY` |
| Limit number of results    | `LIMIT`    |
| Skip rows (for pagination) | `OFFSET`   |

---
