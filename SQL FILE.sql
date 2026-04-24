CREATE DATABASE Sales_data;

USE Sales_data;

SHOW TABLES;

SELECT * FROM fixed_sales_dataset_final;

RENAME TABLE fixed_sales_dataset_final TO sales_dataset;

SELECT * FROM sales_dataset;
DESCRIBE sales_dataset;

SELECT 
STR_TO_DATE(Order_Date, '%m/%d/%Y') AS order_date_converted
FROM sales_dataset;

SELECT SUM(Revenue) AS total_revenue
FROM sales_dataset;

SELECT SUM(Revenue) AS total_revenue_delivered
FROM sales_dataset
WHERE Order_Status = 'Delivered';

SELECT SUM(Revenue) AS total_revenue_delivered_returned
FROM sales_dataset
WHERE Order_Status IN ('Delivered', 'Returned');

SELECT age_group,
SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY age_group
ORDER BY total_revenue DESC;

select * from sales_dataset;

SELECT Product_Category,
SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Product_Category
ORDER BY total_revenue DESC;

SELECT Region,
SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Region
ORDER BY total_revenue DESC;

SELECT Product_Name,
SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Product_Name
ORDER BY total_revenue DESC
LIMIT 5;

select * from sales_dataset;

SELECT Customer_Type,
SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Customer_Type
ORDER BY total_revenue DESC;

SELECT Discount,
SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Discount
ORDER BY Discount;

select * from sales_dataset;

SELECT Order_Status,
COUNT(Order_ID) AS total_orders
FROM sales_dataset
GROUP BY Order_Status
ORDER BY total_orders DESC;

SELECT DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%Y'), '%Y-%m') AS month,
SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY month
ORDER BY month;

select * from sales_dataset;






