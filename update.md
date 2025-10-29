Great! You want the **Markdown documentation for the `UPDATE` statement in MySQL**, using the **`students` table** you shared earlier.

Here’s a full **GitHub-ready Markdown section**, focused **only on `UPDATE`**, but tied to the `students` example. It includes:

* ✅ What it is
* ❓ Why we use it
* ⚙️ How it works
* 📅 When to use
* 📝 Notes and examples with your table

---

### 📄 `update.md` — Full Markdown

````markdown
# 🔄 UPDATE Statement in MySQL (With `students` Table)

The `UPDATE` statement in MySQL is used to **modify existing records** in a table. Below, you'll learn how it works using the sample `students` table.

---

## ✅ What is `UPDATE`?

The `UPDATE` command is used to change one or more columns in one or more rows of a table.

---

## ❓ Why Use `UPDATE`?

You use `UPDATE` when:

- You need to fix incorrect data (e.g., wrong grade, spelling mistake)
- You want to apply changes based on logic (e.g., assign grade based on marks)
- You want to apply bulk changes to records

---

## ⚙️ How to Use `UPDATE`

### 🔸 Basic Syntax

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
````

---

## 🧪 Examples Using `students` Table

> Table recap:
> Columns: `id`, `name`, `marks`, `grade`, `city`

---

### ✅ 1. Update a Student's Grade

Change **Anil's** grade to `'B'`:

```sql
UPDATE students
SET grade = 'B'
WHERE id = 101;
```

---

### ✅ 2. Update Marks for Multiple Students

Give **5 bonus marks** to all students in **Delhi**:

```sql
UPDATE students
SET marks = marks + 5
WHERE city = 'Delhi';
```

---

### ✅ 3. Set Grade Based on Marks

Assign grade `'A'` to students who scored 90 or above:

```sql
UPDATE students
SET grade = 'A'
WHERE marks >= 90;
```

---

### ✅ 4. Bulk Update with Multiple Columns

Update both **grade and city** for a student:

```sql
UPDATE students
SET grade = 'B', city = 'Bangalore'
WHERE name = 'chetan';
```

---

## 📅 When to Use

Use `UPDATE` when:

* You have existing rows that need modification
* You want to change values based on logic
* You're correcting data errors or adjusting records

---

## ⚠️ Notes & Tips

### 🔐 Safe Update Mode

In MySQL Workbench, if `SQL_SAFE_UPDATES` is enabled, you may get this error:

```
Error Code: 1175. You are using safe update mode...
```

### 🛠 Solution:

Disable safe updates (temporarily):

```sql
SET SQL_SAFE_UPDATES = 0;
```

✅ Now your `UPDATE` will run normally.

---

### 🧠 Best Practices

* **Always use a `WHERE` clause** unless you truly want to update all rows.
* Test first with a `SELECT`:

  ```sql
  SELECT * FROM students WHERE grade = 'F';
  ```
* Then run the `UPDATE`:

  ```sql
  UPDATE students SET grade = 'D' WHERE grade = 'F';
  ```

---

## 🧪 Bonus Example: Update with `LIMIT`

> Note: `LIMIT` in `UPDATE` works in MySQL but **not** in all RDBMS.

Update grade for only 2 students with grade `'C'`:

```sql
UPDATE students
SET grade = 'B'
WHERE grade = 'C'
LIMIT 2;
```

---


