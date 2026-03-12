# Superstore Sales Analysis

## Project Overview
This project analyses 9,800 real retail transactions from a US Superstore
covering 2015 to 2018. The analysis uncovers insights about revenue 
performance, customer behaviour, regional trends, and product performance
using MySQL.

## Business Questions Answered
1. What is the overall sales performance?
2. Which category and sub-category drives the most revenue?
3. Which region and state performs best?
4. Who are the top customers by revenue?
5. Which customer segment is most valuable?
6. What is the monthly and yearly sales trend?
7. Which products are the top 10 best sellers?

## Tools Used
- MySQL — data analysis and querying
- Python — data importing
- GitHub — version control and portfolio hosting

## Dataset
- Source: [Kaggle — Sample Superstore Dataset](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)
- File: `sales.csv` (included in this folder)
- 9,800 transactions
- 793 unique customers
- 4,922 unique orders
- Date range: 2015 to 2018

## Key Findings
- Total revenue: **$2,261,536.78** across 9,800 transactions
- **Technology** leads revenue at 36.59% despite fewest transactions
- **California and New York** account for 33.3% of total revenue
- **West region** is the strongest at 31.40% of total revenue
- **Consumer segment** dominates with 50.76% of total revenue
- **September, November and December** are consistently the strongest months
- **Sean Miller** is the top customer at $23,661.23 in revenue
- Revenue grew **56.5%** from 2016 to 2018

## SQL Concepts Demonstrated
- SELECT, WHERE, GROUP BY, ORDER BY
- Aggregate functions (SUM, COUNT, AVG, MAX, MIN)
- DISTINCT for unique counts
- Subqueries for percentage calculations
- Window functions and RANK()
- Date functions (STR_TO_DATE, YEAR, MONTH)
- LIMIT for top N analysis

## Files
- `analysis.sql` — All analysis queries with business questions

## Author
**padazuru-analyst**
Aspiring Data Analyst
