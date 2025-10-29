# 📌 Cascading Foreign Keys (SQL / MySQL)

## ✅ What it is
A **cascading foreign key** is a rule on a foreign key that decides what happens to related rows in a child table when a parent table row is **updated** or **deleted**.  
It keeps relationships between tables consistent.

---

## 🔍 Why it's used
- Ensures **referential integrity** between parent and child tables.  
- Prevents orphan records (child rows without a valid parent).  
- Reduces extra manual update/delete queries.  
- Keeps related data **automatically in sync**.

---

## ⚙️ How it works
When creating a foreign key, you can define actions:

- `ON DELETE CASCADE` → If a parent row is deleted, related child rows are also deleted.  
- `ON UPDATE CASCADE` → If a parent key value is updated, related child keys update too.  

**Syntax:**
```sql
CREATE TABLE child_table (
    child_id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent_table(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
````

---

## 📅 When to use

* When child rows must always follow parent rows.
* In systems like:

  * 🛒 Orders → Order Items
  * 🏫 Department → Employees
  * 🎓 Student → Exams
* When you want **automatic cleanup or updates** of child data.

---

## ⚠️ Notes, tips, and examples

### 🔹 Example 1 – ON DELETE CASCADE

```sql
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
    ON DELETE CASCADE
);
```

👉 If a department is deleted, all its employees are deleted too.

---

### 🔹 Example 2 – ON UPDATE CASCADE

```sql
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE exam (
    exam_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
    ON UPDATE CASCADE
);
```

👉 If a student's `id` changes, it updates automatically in `exam`.

---

## 🧠 Summary Tip

* `CASCADE` → automatic changes flow from parent to child.
* `ON DELETE CASCADE` → deleting parent deletes children.
* `ON UPDATE CASCADE` → updating parent key updates children.
* Be careful ❗—a single delete on parent can wipe out many child rows.


