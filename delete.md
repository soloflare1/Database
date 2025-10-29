You're asking about the **`DELETE`** statement in MySQL — perfect for continuing your GitHub SQL documentation!

I'll now give you a **GitHub-ready Markdown file** focused on the `DELETE` statement, using the same clean structure as before:

* ✅ What
* ❓ Why
* ⚙️ How
* 📅 When
* ⚠️ Safe usage tips
* 🧪 Examples using your `students` table

---

### 📄 `delete.md` — Full Markdown

````markdown
# ❌ DELETE Statement in MySQL (With `students` Table)

The `DELETE` statement is used to **remove rows** from a table permanently. Once deleted, the data cannot be recovered unless you have a backup.

---

## ✅ What is `DELETE`?

The `DELETE` statement removes one or more rows from a table **based on a condition**.

---

## ❓ Why Use `DELETE`?

Use `DELETE` when:

- You need to remove outdated or incorrect data
- You want to clean up a dataset
- You need to delete specific entries based on logic

---

## ⚙️ How to Use `DELETE`

### 🔸 Basic Syntax

```sql
DELETE FROM table_name
WHERE condition;
````

> ⚠️ **Without a `WHERE` clause, all rows will be deleted!**

---

## 🧪 Examples Using `students` Table

Assuming you have the table:

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(5),
    city VARCHAR(20),
    PRIMARY KEY(id)
);
```

### ✅ 1. Delete One Student by ID

```sql
DELETE FROM students
WHERE id = 105;
```

This removes the student named **emanuel**.

---

### ✅ 2. Delete Students With Failing Marks

```sql
DELETE FROM students
WHERE marks < 40;
```

---

### ✅ 3. Delete All Students from Delhi

```sql
DELETE FROM students
WHERE city = 'Delhi';
```

---

## 📅 When to Use `DELETE`

Use `DELETE` when:

* You want to remove specific rows (with a `WHERE` clause)
* You're managing data lifecycle (e.g., removing inactive users)
* Cleaning up test data after operations

---

## ⚠️ Safe Usage Tips

### 🔐 Safe Update Mode Warning

In some MySQL setups (e.g. MySQL Workbench), you'll see:

```
Error Code: 1175. You are using safe update mode...
```

### ✅ Fix:

```sql
SET SQL_SAFE_UPDATES = 0;
```

Then run your `DELETE` statement.

---

### 🛡️ Best Practices

* **NEVER delete without `WHERE` unless intentional**
* Always run a `SELECT` first to preview:

```sql
-- Preview
SELECT * FROM students WHERE city = 'Delhi';

-- Then delete
DELETE FROM students WHERE city = 'Delhi';
```

* Use transactions if supported:

```sql
START TRANSACTION;
DELETE FROM students WHERE marks < 40;
ROLLBACK; -- or COMMIT;
```

---

## 🧪 Bonus: Delete All Rows from a Table

```sql
DELETE FROM students;
```

> ⚠️ This removes **all rows** but keeps the table structure.
> Alternative: use `TRUNCATE TABLE students;` for faster bulk deletes (no rollback).
---

