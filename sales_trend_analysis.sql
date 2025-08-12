
-- Task 6: Sales Trend Analysis Using Aggregations
-- Dataset: online_sales (order_date, amount, product_id, order_id)

-- 1. Monthly Revenue & Order Volume
SELECT
    STRFTIME('%Y', order_date) AS order_year,
    STRFTIME('%m', order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- 2. Top 3 Months by Sales
SELECT
    STRFTIME('%Y', order_date) AS order_year,
    STRFTIME('%m', order_date) AS order_month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- 3. Monthly Revenue with Ranking
SELECT
    order_year,
    order_month,
    monthly_revenue,
    order_volume,
    RANK() OVER (ORDER BY monthly_revenue DESC) AS revenue_rank
FROM (
    SELECT
        STRFTIME('%Y', order_date) AS order_year,
        STRFTIME('%m', order_date) AS order_month,
        SUM(amount) AS monthly_revenue,
        COUNT(DISTINCT order_id) AS order_volume
    FROM online_sales
    GROUP BY order_year, order_month
) sub;
