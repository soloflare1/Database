# ALTER 

## ✅ What it is
The `ALTER` statement is used to modify an existing table structure in a database.  
It allows adding, deleting, or changing columns and constraints without recreating the table.

---

## 🔍 Why it's used
- To **add new columns** as the database evolves.  
- To **remove unnecessary columns**.  
- To **change data types, sizes, or constraints** of existing columns.  
- To **rename a table**.  

---

🧠 **Summary tip:**
👉 Use `ALTER` when structure changes are needed.
👉 For data changes, use `UPDATE` instead.
👉 Always **backup or check structure** before altering important tables.

---

## ➕ ADD

### ✅ What it is
Used to add a new column to a table.

### ⚙️ Syntax
```sql
ALTER TABLE table_name
ADD column_name datatype;
````

### 💡 Example

```sql
ALTER TABLE stu
ADD age INT NOT NULL DEFAULT 0;
```

---

## ❌ DROP

### ✅ What it is

Used to remove (drop) a column from a table.

### ⚙️ Syntax

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

### 💡 Example

```sql
ALTER TABLE stu
DROP COLUMN age;
```

⚠️ **Warning:** Once dropped, the column and its data are permanently lost.

---

## ✏️ MODIFY

### ✅ What it is

Used to change the **datatype, size, or constraints** of an existing column.

### ⚙️ Syntax

```sql
ALTER TABLE table_name
MODIFY column_name new_datatype;
```

### 💡 Example

```sql
ALTER TABLE stu
MODIFY marks DECIMAL(5,2);
```

---

## 🔄 RENAME

### ✅ What it is

Used to rename a table (and in MySQL 8+, rename a column too).

### ⚙️ Syntax (rename table)

```sql
ALTER TABLE old_table_name
RENAME TO new_table_name;
```

### 💡 Example

```sql
ALTER TABLE students
RENAME TO stu;
```

### ⚙️ Syntax (rename column – MySQL 8+)

```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

### 💡 Example

```sql
ALTER TABLE stu
RENAME COLUMN name TO full_name;
```

---

## 🔀 CHANGE

### ✅ What it is

Used to **rename a column and change its datatype** in one step.
(Older MySQL versions used this instead of `RENAME COLUMN`.)

### ⚙️ Syntax

```sql
ALTER TABLE table_name
CHANGE old_name new_name datatype;
```

### 💡 Example

```sql
ALTER TABLE stu
CHANGE marks score INT;
```

---

## 🧠 Summary Tips

* `ADD` → add new column(s).
* `DROP` → permanently remove a column.
* `MODIFY` → change datatype/constraints (name unchanged).
* `CHANGE` → rename + change datatype (older method).
* `RENAME` → rename table or column (simpler in MySQL 8+).

👉 Always run `DESCRIBE table_name;` after altering to confirm changes.
👉 Take backups before making structural changes to production tables.
