# SQL-ChinookDB-Analysis

## Data Model

- The data is about a digital media store, featuring tables for **artists**, **albums**, **media tracks**, **invoices**, and **customers**.
- To explore the full story behind the **Chinook Database** - its purpose, origin, and details - visit [lerocha](https://github.com/lerocha/chinook-database).

![ERD](images/ERD.png)

---

## Overview

Analyze the Chinook Database using SQL to extract business insights—such as top-selling products, revenue by region, and monthly performance—through JOINs, aggregations, and window functions.

## Why SQL Analysis ?

The data is only in a database format, so I have to use SQL queries to answer the business questions.

### Business Questions

- Top-Selling Products.
- Revenue Per Region.
- Monthly Performance.

### Update

After answering the business questions, it was found that:

- Top-Selling Products: Dazed and Confused, **The Trooper**.
- Top Region by Total Revenue: **USA — 523.06**.
- Highest Monthly Performance: **April 2023 — 51.62** (with all other months included in the results).

### Steps to Follow

- **You will find all the SQL Queries in the [sql_script.sql](SQL/mysql_script.sql) file, and the most important file to fully understand the whole process is the [sql_process.md](SQL/sql_process.md).**

**Main Files to Check:**

- `SQL/sql_process.md` → This file documents the project process.
- `images/ Q1:Q4` → Screenshots of the query executions.
- `SQL/Chinook_MySql.sql` → Database scripts.
- `LICENSE.md` → Outher License

## Getting Started

**Clone the repository:**

```bash
git clone git@github.com:khattabx/SQL-ChinookDB-Analysis.git
```
