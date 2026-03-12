-- Project: Retail Sales Performance Analysis
-- Author: padazuru-analyst
-- Date: 2026
-- Description: Analysis queries answering key business questions

USE retail_practice;

-- QUESTION 1: Overall Sales Performance

SELECT 
    COUNT(*)                    AS total_transactions,
    SUM(amount)                 AS total_revenue,
    AVG(amount)                 AS average_sale,
    MAX(amount)                 AS highest_sale,
    MIN(amount)                 AS lowest_sale
FROM sales;

-- QUESTION 2: Product and Category Performance

-- Revenue by category
SELECT 
    category,
    COUNT(*)                    AS total_sales,
    SUM(amount)                 AS total_revenue,
    ROUND(AVG(amount), 2)       AS average_sale,
    ROUND(SUM(amount) / (SELECT SUM(amount) FROM sales) * 100, 2) AS revenue_percentage
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Revenue by product
SELECT 
    product,
    category,
    COUNT(*)                    AS times_sold,
    SUM(amount)                 AS total_revenue
FROM sales
GROUP BY product, category
ORDER BY total_revenue DESC;

-- QUESTION 3: Customer Value Analysis

SELECT 
    c.name,
    c.city,
    COUNT(*)                    AS total_purchases,
    SUM(s.amount)               AS total_spent,
    RANK() OVER(ORDER BY SUM(s.amount) DESC) AS spending_rank,
    CASE
        WHEN SUM(s.amount) > 1500 THEN 'VIP'
        WHEN SUM(s.amount) BETWEEN 500 AND 1500 THEN 'Regular'
        ELSE 'Inactive'
    END AS segment
FROM customers c
JOIN sales s USING(customer_id)
GROUP BY c.name, c.city
ORDER BY total_spent DESC;

-- QUESTION 4: Revenue by City

SELECT 
    c.city,
    COUNT(*)                    AS total_transactions,
    SUM(s.amount)               AS total_revenue,
    ROUND(SUM(s.amount) / (SELECT SUM(amount) FROM sales) * 100, 2) AS revenue_percentage
FROM customers c
JOIN sales s USING(customer_id)
GROUP BY c.city
ORDER BY total_revenue DESC;

-- QUESTION 5: Customer Segmentation Summary

WITH customer_totals AS (
    SELECT 
        c.name,
        SUM(s.amount) AS total_spent,
        CASE
            WHEN SUM(s.amount) > 1500 THEN 'VIP'
            WHEN SUM(s.amount) BETWEEN 500 AND 1500 THEN 'Regular'
            ELSE 'Inactive'
        END AS segment
    FROM customers c
    JOIN sales s USING(customer_id)
    GROUP BY c.name
)
SELECT 
    segment,
    COUNT(*)                    AS total_customers,
    SUM(total_spent)            AS segment_revenue,
    ROUND(AVG(total_spent), 2)  AS average_spending
FROM customer_totals
GROUP BY segment
ORDER BY segment_revenue DESC;

-- QUESTION 6: Monthly Revenue Trend

SELECT 
    DATE_FORMAT(sale_date, '%Y-%m')     AS month,
    COUNT(*)                            AS total_transactions,
    SUM(amount)                         AS monthly_revenue,
    ROUND(AVG(amount), 2)               AS average_sale
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')

ORDER BY month;
