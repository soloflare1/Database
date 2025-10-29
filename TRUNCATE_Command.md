# 🗑️ TRUNCATE Command

## ✅ What it is
The `TRUNCATE` command is used to **delete all rows** from a table instantly, while keeping the table structure (columns, constraints, indexes) intact.  
It’s like a **faster version of `DELETE` without a `WHERE` clause**.

---

## 🔍 Why it's used
- To quickly clear all data from a table.  
- To reset auto-increment counters back to 1.  
- To save time compared to row-by-row `DELETE`.  

---

## ⚙️ How it works
**Basic Syntax:**
```sql
TRUNCATE TABLE table_name;
````

* Removes all rows from `table_name`.
* Frees the space used by the table.
* Keeps the table structure intact.

---

## 📅 When to use

* When you want to **empty the entire table** but reuse it later.
* During testing → clear dummy data.
* When resetting tables (like logs, temp data, sessions).

---

## ⚠️ Notes, tips, and examples

### 1. Truncate a table

```sql
TRUNCATE TABLE stu;
```

👉 Removes all rows from `stu`.

### 2. Difference with DELETE

| Feature                | DELETE                       | TRUNCATE                            |
| ---------------------- | ---------------------------- | ----------------------------------- |
| Removes rows           | Row by row (can use `WHERE`) | All rows instantly (no `WHERE`)     |
| Speed                  | Slower for large tables      | Much faster                         |
| Auto-increment reset   | ❌ No                         | ✅ Yes                               |
| Rollback (transaction) | ✅ Can be rolled back         | ⚠️ Sometimes cannot (depends on DB) |
| Triggers fired?        | ✅ Yes                        | ❌ No                                |

---

🧠 **Summary Tip:**

* Use `TRUNCATE` to **quickly wipe out all rows** but keep the table.
* Use `DELETE` if you need **conditions** or want to fire triggers.
* Use `DROP` if you want to remove the **entire table structure** too.
