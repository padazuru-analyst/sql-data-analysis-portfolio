-- Project: Superstore Sales Analysis
-- Author: padazuru-analyst
-- Date: 2026
-- Description: Analysis of 9,800 retail transactions
-- covering 2015 to 2018

USE superstore;

-- QUESTION 1: Overall Sales Performance

SELECT
    COUNT(*)                        AS total_transactions,
    COUNT(DISTINCT order_id)        AS total_orders,
    COUNT(DISTINCT customer_id)     AS total_customers,
    ROUND(SUM(sales), 2)            AS total_revenue,
    ROUND(AVG(sales), 2)            AS average_sale,
    ROUND(MAX(sales), 2)            AS highest_sale,
    ROUND(MIN(sales), 2)            AS lowest_sale
FROM sales;

-- QUESTION 2: Category & Sub-Category Performance

-- Revenue by category
SELECT
    category,
    COUNT(*)                                        AS total_transactions,
    ROUND(SUM(sales), 2)                            AS total_revenue,
    ROUND(AVG(sales), 2)                            AS average_sale,
    ROUND(SUM(sales) /
        (SELECT SUM(sales) FROM sales) * 100, 2)    AS revenue_percentage
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Revenue by sub-category
SELECT
    category,
    sub_category,
    COUNT(*)                        AS total_transactions,
    ROUND(SUM(sales), 2)            AS total_revenue,
    ROUND(AVG(sales), 2)            AS average_sale
FROM sales
GROUP BY category, sub_category
ORDER BY total_revenue DESC;

-- QUESTION 3: Regional & State Performance

-- Revenue by region
SELECT
    region,
    COUNT(*)                                        AS total_transactions,
    COUNT(DISTINCT customer_id)                     AS total_customers,
    ROUND(SUM(sales), 2)                            AS total_revenue,
    ROUND(SUM(sales) /
        (SELECT SUM(sales) FROM sales) * 100, 2)    AS revenue_percentage
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Top 10 states by revenue
SELECT
    state,
    region,
    COUNT(*)                        AS total_transactions,
    ROUND(SUM(sales), 2)            AS total_revenue
FROM sales
GROUP BY state, region
ORDER BY total_revenue DESC
LIMIT 10;

-- QUESTION 4: Top 10 Customers By Revenue

SELECT
    customer_name,
    segment,
    state,
    COUNT(DISTINCT order_id)        AS total_orders,
    COUNT(*)                        AS total_transactions,
    ROUND(SUM(sales), 2)            AS total_revenue,
    RANK() OVER(ORDER BY
        SUM(sales) DESC)            AS revenue_rank
FROM sales
GROUP BY customer_name, segment, state
ORDER BY total_revenue DESC
LIMIT 10;

-- QUESTION 5: Customer Segment Analysis

SELECT
    segment,
    COUNT(DISTINCT customer_id)                     AS total_customers,
    COUNT(DISTINCT order_id)                        AS total_orders,
    COUNT(*)                                        AS total_transactions,
    ROUND(SUM(sales), 2)                            AS total_revenue,
    ROUND(AVG(sales), 2)                            AS average_sale,
    ROUND(SUM(sales) /
        (SELECT SUM(sales) FROM sales) * 100, 2)    AS revenue_percentage
FROM sales
GROUP BY segment
ORDER BY total_revenue DESC;

-- QUESTION 6: Yearly & Monthly Sales Trend

-- Yearly trend
SELECT
    YEAR(STR_TO_DATE(order_date, '%d/%m/%Y'))   AS year,
    COUNT(DISTINCT order_id)                     AS total_orders,
    COUNT(*)                                     AS total_transactions,
    ROUND(SUM(sales), 2)                         AS total_revenue,
    ROUND(AVG(sales), 2)                         AS average_sale
FROM sales
GROUP BY year
ORDER BY year;

-- Monthly trend
SELECT
    YEAR(STR_TO_DATE(order_date, '%d/%m/%Y'))    AS year,
    MONTH(STR_TO_DATE(order_date, '%d/%m/%Y'))   AS month,
    COUNT(*)                                      AS total_transactions,
    ROUND(SUM(sales), 2)                          AS total_revenue
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- QUESTION 7: Top 10 Products By Revenue

SELECT
    product_name,
    category,
    sub_category,
    COUNT(*)                    AS times_sold,
    ROUND(SUM(sales), 2)        AS total_revenue,
    ROUND(AVG(sales), 2)        AS average_sale
FROM sales
GROUP BY product_name, category, sub_category
ORDER BY total_revenue DESC
LIMIT 10;