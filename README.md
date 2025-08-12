# Sales Trend Analysis - Task 6

This repository contains the solution for **Task 6: Sales Trend Analysis Using Aggregations** as part of the Data Analyst Internship program.

## Objective
Analyze monthly revenue and order volume from the `online_sales` dataset using SQL aggregation functions, and identify the top-performing months.

## Dataset
**Table:** `online_sales`  
**Columns:**
- `order_id` (INTEGER) – Unique order identifier
- `order_date` (TEXT) – Date of order
- `amount` (REAL) – Revenue from the order
- `product_id` (INTEGER) – Product identifier

## Steps Performed
1. **Monthly Revenue & Order Volume**
   - Grouped sales data by year & month using:
     ```sql
     STRFTIME('%Y', order_date), STRFTIME('%m', order_date)
     ```
   - Calculated total monthly revenue with:
     ```sql
     SUM(amount)
     ```
   - Counted unique orders using:
     ```sql
     COUNT(DISTINCT order_id)
     ```

2. **Top 3 Months by Sales**
   - Ordered results by `monthly_revenue` in descending order.
   - Limited output to top 3 months using:
     ```sql
     LIMIT 3
     ```

3. **Monthly Revenue with Ranking**
   - Used `RANK()` window function to assign a rank based on revenue for each month.

## Files in Repository
- `sales_trend_analysis.sql` – SQL script with all three queries.
- `results.csv` – Output of monthly revenue & order volume query.
- `top_3_months.csv` – Output of top 3 months by revenue.
- `monthly_revenue_ranked.csv` – Monthly data with revenue ranking.
- `Sales_Trend_Analysis_Task6_Screenshots.pdf` – Screenshots of query execution and results.
- `sales.db` – SQLite database file containing the sample `online_sales` table.

## Tools Used
- SQLite (with DB Browser for SQLite)
- SQL aggregation and window functions

## Description
SQL-based sales trend analysis project for Task 6 of the Data Analyst Internship. Includes queries to calculate monthly revenue, order volume, top sales months, and ranked performance, along with CSV outputs and execution screenshots.
