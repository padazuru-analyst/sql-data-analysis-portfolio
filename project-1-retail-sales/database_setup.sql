-- Project: Retail Sales Performance Analysis
-- Author: padazuru-analyst
-- Date: 2026
-- Description: Database setup for retail sales analysis

CREATE DATABASE IF NOT EXISTS retail_practice;
USE retail_practice;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Alice Johnson', 'New York', 34, 'Female'),
(2, 'Bob Smith', 'Chicago', 45, 'Male'),
(3, 'Clara Davis', 'Houston', 29, 'Female'),
(4, 'David Lee', 'New York', 52, 'Male'),
(5, 'Eva Brown', 'Chicago', 38, 'Female'),
(6, 'Frank Wilson', 'Houston', 41, 'Male'),
(7, 'Grace Miller', 'New York', 27, 'Female'),
(8, 'Henry Moore', 'Chicago', 33, 'Male');

INSERT INTO sales VALUES
(1,  1, 'Laptop',     'Electronics', 1200.00, '2024-01-05'),
(2,  2, 'Chair',      'Furniture',    350.00, '2024-01-08'),
(3,  3, 'Laptop',     'Electronics', 1200.00, '2024-01-10'),
(4,  4, 'Phone',      'Electronics',  800.00, '2024-01-15'),
(5,  5, 'Desk',       'Furniture',    500.00, '2024-02-02'),
(6,  6, 'Headphones', 'Electronics',  150.00, '2024-02-10'),
(7,  7, 'Phone',      'Electronics',  800.00, '2024-02-14'),
(8,  8, 'Chair',      'Furniture',    350.00, '2024-02-20'),
(9,  1, 'Headphones', 'Electronics',  150.00, '2024-03-01'),
(10, 3, 'Desk',       'Furniture',    500.00, '2024-03-05'),
(11, 5, 'Laptop',     'Electronics', 1200.00, '2024-03-12'),

(12, 2, 'Phone',      'Electronics',  800.00, '2024-03-18');
