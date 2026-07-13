# 📁 Phase 4 – Business Analytics using PySpark and Spark SQL

## 📌 Objective

The objective of this phase is to perform business analytics using PySpark and Spark SQL by analyzing customer and sales datasets. The project focuses on data cleaning, aggregations, customer segmentation, and generating business reports.

---

## 📂 Folder Structure

```
PHASE4/
│
├── PHASE4.ipynb
├── README.md
├── customers_phase4.csv
├── sales_phase4.csv
├── phase4_queries.sql
└── phase4_pyspark.py
```

---

## 🛠 Technologies Used

- Databricks Community Edition
- Apache Spark (PySpark)
- Spark SQL
- CSV Files

---

## 📊 Datasets

### customers_phase4.csv

Contains customer information.

Columns:
- customer_id
- customer_name
- city
- state
- phone
- email
- join_date

### sales_phase4.csv

Contains sales transaction details.

Columns:
- sale_id
- customer_id
- product_name
- category
- quantity
- unit_price
- total_amount
- sale_date
- payment_method

---

## 🔄 Data Preprocessing

Before performing analysis, the following preprocessing steps were completed:

- Loaded customer and sales datasets.
- Inspected schemas and sample records.
- Counted NULL values.
- Removed records with NULL customer IDs.
- Removed duplicate records.
- Filtered invalid sales records.
- Created temporary SQL views for Spark SQL.

---

## 📈 Business Analytics Tasks

### Task 1 – Daily Sales Report

Calculated the total sales amount for each day.

### Task 2 – City-wise Revenue

Calculated total revenue generated from each city.

### Task 3 – Top 5 Customers

Identified the top five customers based on total spending.

### Task 4 – Repeat Customers

Displayed customers who placed more than one order.

### Task 5 – Customer Segmentation

Segmented customers into:

- Gold
- Silver
- Bronze

based on their total spending.

### Task 6 – Final Reporting Table

Generated a consolidated report containing:

- Customer Name
- City
- Total Spend
- Order Count
- Customer Segment

### Task 7 – Save Final Report

Saved the final report as a Spark table named **final_report**.

---

## 📄 Files

### phase4_queries.sql

Contains all Spark SQL queries for the business analytics tasks.

### phase4_pyspark.py

Contains equivalent PySpark DataFrame implementations for all tasks.

---

## 🎯 Learning Outcomes

After completing this phase, I learned how to:

- Load CSV files into PySpark.
- Perform data cleaning and validation.
- Remove NULL values and duplicate records.
- Filter invalid records.
- Create temporary SQL views.
- Perform aggregations using Spark SQL and PySpark.
- Use CASE statements and `when()` for customer segmentation.
- Generate business reports using joins and aggregation functions.
- Save processed results as Spark tables.

---

## 🚀 Author

**Shaik Mahammad Luqman**

B.Tech – Artificial Intelligence & Data Science
