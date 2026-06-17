# SQL for QA Engineers

A practical collection of SQL queries used in QA work — backend data validation, test data verification, and database testing.

All examples run against a fictional **ShopEase** e-commerce database. No proprietary data is included.

---

## Why SQL Matters for QA

Manual and API testing confirm what the user sees. SQL confirms what actually happened in the database — that data was saved correctly, relationships are intact, and no orphaned or duplicate records were created. This is essential for thorough backend validation.

---

## What's Inside

| Folder | Contents |
|---|---|
| [`sample-schema/`](./sample-schema) | The ShopEase database schema used in all examples |
| [`queries/`](./queries) | Validation, data integrity, and JOIN queries for QA |
| [`notes/`](./notes) | SQL best practices for testers |

---

## Sample Database: ShopEase

The examples use three core tables:

- **users** — registered customers
- **products** — items for sale
- **orders** — purchases linking users to products

---

## Skills Demonstrated

- SELECT, WHERE, ORDER BY, LIMIT
- Aggregate functions (COUNT, SUM, AVG)
- GROUP BY and HAVING
- INNER and LEFT JOINs across tables
- Data integrity checks (duplicates, orphaned records, NULL validation)
- Test data verification after a test execution

---

## About Me

QA Engineer with 5 years of experience, including database validation using MySQL and DBeaver to verify backend data consistency.
Profile: [github.com/hassanalirazza](https://github.com/hassanalirazza)
