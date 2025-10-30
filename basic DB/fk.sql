# Foreign Key in MySQL

## 1. Definition

A **foreign key (FK)** is a column or a set of columns in one table that **refers to the primary key (PK) of another table**. It is used to maintain **referential integrity** between two tables.

**Key points:**

* Ensures that a value in one table exists in another table.
* Helps maintain relationships between tables.
* Prevents invalid data in the child table.

---

## 2. Important Rules

1. The **foreign key column must exist** in the table before creating the foreign key.
2. The referenced column (usually a primary key) must already exist in the parent table.
3. Foreign keys can be single-column or multi-column (composite).
4. Data type of FK must match the referenced column.

---

## 3. Syntax

```sql
CREATE TABLE child_table (
    column1 datatype,
    column2 datatype,
    ...,
    FOREIGN KEY (column_name) REFERENCES parent_table(parent_column)
);
```

**Example with Students and Courses:**

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade CHAR(2),
    PRIMARY KEY(student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

**Explanation:**

* `student_id` in `enrollments` refers to `student_id` in `students`.
* `course_id` in `enrollments` refers to `course_id` in `courses`.
* `PRIMARY KEY(student_id, course_id)` ensures no duplicate enrollment.

---
-- 1. Parent Table: department
  ```
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
```
-- 2. Child Table: students with FK
```
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
```
---
## 4. Important Notes

* Foreign keys **do not create columns**; you must define the columns first.
* MySQL will throw an **error** if:

  * The FK column does not exist.
  * The referenced table or column does not exist.
  * Data types do not match.

---

## 5. Advantages

* Maintains **data integrity**.
* Prevents **orphan records** in child tables.
* Establishes **clear relationships** between tables.

