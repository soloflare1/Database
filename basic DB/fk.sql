# Foreign Key in MySQL
# University Database Notes 
---

## 🔑 Foreign Key Concept

A **Foreign Key (FK)** connects a child table to a parent table. But the **child table must create its own column first**.

### ⭐ Why child table must create the column again?

Because a **foreign key does NOT create a column**. It only applies a *rule* on an existing column.

So two steps are required:

1. **Create the column** in the child table → so it can store values
2. **Apply FK** → so those values must match the parent table’s primary key

### ✔ Short Note (Very Easy)

Foreign key sudhu rule dey — column create kore na. Tai child table e abar oi column declare korte hoy, jate parent table er value refer korte pare.

---

## 🔧 ON DELETE / ON UPDATE Rules

A **Foreign Key (FK)** is a field in one table that refers to the **Primary Key (PK)** of another table. It creates a *parent–child* relationship.

### ✔ Why Foreign Keys Are Important

* Ensures data consistency
* Prevents invalid entries
* Maintains relationships between tables
* Protects database from accidental mistakes

Example:

* `students.student_id` → Parent
* `enrollments.student_id` → Child

The FK ensures you **cannot insert an enrollment for a student who does not exist**.

---

## 🔧 ON DELETE / ON UPDATE Rules

Foreign Keys can define what happens when parent table data changes.

### 1️⃣ **ON DELETE CASCADE**

If a student is deleted → all their enrollments are also deleted.

### 2️⃣ **ON DELETE RESTRICT / NO ACTION** (default)

Prevents deleting a record if it's being referenced.

### 3️⃣ **ON UPDATE CASCADE**

If a student_id or course_id is updated → changes automatically propagate to enrollments.

### 4️⃣ **ON UPDATE RESTRICT**

Prevents updating IDs if they are in use.

---

### ✔ Example With CASCADE

```sql
create table enrollments(
    student_id int,
    course_id int,
    grade char(2),
    score int,
    primary key(student_id, course_id),
    foreign key(student_id)
        references students(student_id)
        on delete cascade
        on update cascade,

    foreign key(course_id)
        references courses(course_id)
        on delete cascade
        on update cascade
);
```

---

## 📌 Database Structure

The database contains three main tables:

### 1. **students**

Stores basic student information.

* `student_id` (Primary Key)
* `name`
* `dept`

### 2. **courses**

Stores course details.

* `course_id` (Primary Key)
* `course_name`
* `credit` (Allowed range: 1–3)

### 3. **enrollments**

Stores which student enrolled in which course.

* `student_id` (Foreign Key → students.student_id)
* `course_id` (Foreign Key → courses.course_id)
* `grade`
* `score`
* **Composite Primary Key:** (`student_id`, `course_id`)

---

## 🔗 Why Foreign Keys Are Used

Foreign keys connect tables logically:

* A student must exist before enrolling.
* A course must exist before students can enroll in it.

Foreign keys ensure **data integrity** and prevent invalid entries.

---

## 🧩 Why Columns Are Declared Again in `enrollments`

Foreign keys **do not create columns**. You must:

1. Declare the column → `student_id INT`
2. Apply FK on it → `FOREIGN KEY (student_id) REFERENCES students(student_id)`

This is required in SQL.

---

## 🗂 Example SQL Code

```sql
drop database university;
create database university;
use university;

create table students(
    student_id int primary key,
    name varchar(50),
    dept varchar(50)
);

create table courses(
    course_id int primary key,
    course_name varchar(100),
    credit int check (credit between 1 and 3)
);

create table enrollments(
    student_id int,
    course_id int,
    grade char(2),
    score int,
    primary key(student_id, course_id),
    
    foreign key(student_id) 
    references students(student_id),
    
    foreign key(course_id) 
    references courses(course_id)
);
```


***************************
# ⭐ **Does child table need same number of rows as parent?**

❌ **NO! Not required.**

Child table does **NOT** need to have:

* same number of rows
* same values
* same amount of data

Only rule is:

# ✔ **Every child value must exist in the parent.**

That’s it.

---

# ⭐ Example (Easy)

### Parent: `students`

```
student_id
-----------
1
2
3
4
5
```

### Child: `enrollments`

```
student_id   course_id
-----------  ---------
1            101
1            102
3            101
5            105
```

### Observations:

* Parent has **5 values**
* Child has only **4 rows**
* Child uses only: **1, 1, 3, 5**
* Parent has values child never uses (2, 4) → **totally fine**
* Child values (1, 3, 5) exist in parent → ✔ valid
* If child tries 10 (not in parent) → ❌ foreign key error

---

# ⭐

| Question                                            | Answer                             |
| --------------------------------------------------- | ---------------------------------- |
| Child table must have same number of rows?          | ❌ No                               |
| Child must use all parent values?                   | ❌ No                               |
| Parent must have matching value for each child row? | ✔ Yes                              |
| Child can have fewer rows?                          | ✔ Yes                              |
| Child can repeat parent values?                     | ✔ Yes (1 student many enrollments) |




**************************


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
    FOREIGN KEY (column_name) 
    REFERENCES parent_table(parent_column)
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




    ###
