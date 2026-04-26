# Sales-Overview-and-Trends-Dashboard
### .Excel . SQL . Power BI

## 📚 Table of Contents

- [Project Overview](#project-overview)
- [Tools & Technologies](#tools-&-Ttchnologies)
- [Dataset Overview](#dataset-overview)
- [Sample Preview](#sample-preview)
- [Data Cleaning Procedures](#data-cleaning-procedures)
- [Exploratory Analysis (mysql)](#exploratory-analysis_(mysql))
- [Excel Dashboard](#excel-dashboard)
- [Power BI Dashboard](#power-bi-dashboard)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [Future Works](#future-works)
- [Data Source](#data-source)


### Project Overview

Sales Overview and Trends Dashboard: This is a comprehensive project that uncovers key insights from sales data,
including revenue trends, product performance, regional sales, profits, and discount impacts. 
Using Excel for data cleaning, transformation, creating pivot tables, and building initial dashboards, 
SQL for data exploration, and Power BI for interactive dashboards, this project transforms raw sales records 
into actionable business insights to support strategic decision-making.

### Tools & TechnologieS

Excel

SQL (MySQL)

Power BI

### Dataset Overview
The dataset contains the following columns:
Order_ID, Order_Date, Customer_Name, Customer_Type, Gender,
Age, Age Group, City , Region, Product_Category, Product_Name,
Quantity, Unit_Price, Discount, Revenue, Delivered_Revenue, Delivered & Returned Revenue, 
Payment_Method and Order_Status.


### Sample Preview
 Order ID | Order Date | Customer Name | Customer Type | Gender | Age | Age Group | City   | Region    | Product Category   | Product Name | Quantity | Unit Price | Discount | Revenue | Delivered Revenue | Delivered & Returned Revenue | Payment Method | Order Status |
| -------- | ---------- | ------------- | ------------- | ------ | --- | --------- | ------ | --------- | ------------------ | ------------ | -------- | ---------- | -------- | ------- | ----------------- | ---------------------------- | -------------- | ------------ |
| 10001    | 03/12/2024 | John umeh       | New           | Female | 20  | 18–25     | Lagos  | Southwest | Kitchen Appliances | Blender      | 5        | 69,196     | 5%       | 328,681 | 328,681           | 0                            | Cash           | Returned     |
| 10002    | 08/17/2024 | Emeka Bello   | New           | Male   | 62  | 46–80     | Ibadan | Northwest | Kitchen Appliances | Microwave    | 9        | 114,974    | 5%       | 983,027 | 0                 | 983,073                      | Transfer       | Returned     |



### Data Cleaning Procedures
* Removed duplicate records to ensure data accuracy
* Corrected data formats (e.g., date, numeric, and text formats) for consistency
* Handled inconsistent values where necessary
* Standardized column names and entries for uniformity
* Created new calculated fields, including:
* Age Group
* Delivered Revenue
* Delivered & Returned Revenue
* Ensured consistency in currency and numerical values (e.g., revenue, unit price, discount)


### Exploratory Analysis(mysql)

1. Creating the Database and Using the Database   
```sql
CREATE DATABASE
   Sales_data;
```
```sql
USE
  Sales_data;
```
```sql
SHOW TABLES;
```
2. Renaming the Dataset
```sql
SELECT *
  FROM fixed_sales_dataset_final;
```
```sql
RENAME TABLE
  fixed_sales_dataset_final TO sales_dataset;
```
3. Describing the Dataset
```sql
SELECT *
  FROM sales_dataset;
```
```sql
DESCRIBE
  sales_dataset;
```
4. Formating the Date
```sql
SELECT 
    STR_TO_DATE(Order_Date, '%m/%d/%Y') AS order_date_converted
FROM sales_dataset;
```
5. Total Revenue
```sql
SELECT
    SUM(Revenue) AS total_revenue
FROM sales_dataset;
```
6. Total Revenue Delivered
```sql
SELECT
    SUM(Revenue) AS total_revenue_delivered
FROM sales_dataset
WHERE Order_Status = 'Delivered';
```
7. Sum of Delivered and Cancelled Revenue
```sql
SELECT
    SUM(Revenue) AS total_revenue_delivered_returned
FROM sales_dataset
WHERE Order_Status IN ('Delivered', 'Returned');
```
8. Revenue by Age Group
```sql
SELECT
    age_group,
    SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY age_group
ORDER BY total_revenue DESC;
```

```sql
SELECT *
  from sales_dataset;
```
9. Revenue by Product Cathegory
```sql
SELECT
    Product_Category,
    SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Product_Category
ORDER BY total_revenue DESC;
```
10. Revenue by Region DESC.
```sql
SELECT
    Region,
    SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Region
ORDER BY total_revenue DESC;
```
11. Top 5 Products by Revenue
```sql
SELECT
    Product_Name,
    SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Product_Name
ORDER BY total_revenue DESC
LIMIT 5;
```

```sql
select *
from sales_dataset;
```
12.Revenue by Customer Type
```sql
SELECT
    Customer_Type,
    SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Customer_Type
ORDER BY total_revenue DESC;
```
13.Discount VS Revenue
```sql
SELECT
    Discount,
    SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY Discount
ORDER BY Discount;
```
14.Order Status Analysis DESC.
```sql
SELECT
    Order_Status,
    COUNT(Order_ID) AS total_orders
FROM sales_dataset
GROUP BY Order_Status
ORDER BY total_orders DESC;
```
15. Monthly Trend Analysis by Revenue
```sql
SELECT
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%Y'), '%Y-%m') AS month,
    SUM(Revenue) AS total_revenue
FROM sales_dataset
GROUP BY month
ORDER BY month;
```

```sql
select *
from sales_dataset;
```
### Excel Dashboard 
This Excel dashboard includes the following visuals:
1. Sales Trend 
2. Sales by Region
3. Order Status Analysis
4. Sales by Product Category
5. Top 5 Products by Revenue
6. Discount vs Revenue Analysis
7. Customer Type Analysis
8. Age Group Analysis
#### The dashboard also includes slicers for interactive filtering, such as:
9. Region
10. Product Category
11. Customer Type
12. Timeline (Date Filter)
#### Additionally, the dashboard displays key performance indicators (KPIs), including:
13. Total Revenue
14. Delivered Revenue
15. Delivered & Returned Revenue
16. Total Orders
17. Total Quantity Sold
18. Average Order Value

### Power BI Dashboard
This Power BI dashboard includes the following visuals:
1. Discount vs Revenue Analysis
2. Top 5 Products by Revenue
3. Sales Trend Analysis 
4. Age Group Analysis
5. Sales by Product Category
6. Sales by Region
7. Order Status Analysis
#### The dashboard also features key performance indicators (KPIs), including:
8. Total Revenue
9. Total Delivered Revenue
10. Total Delivered & Returned Revenue
11. Total Quantity Sold
12. Total Orders
13. Average Order Value
#### Additionally, the dashboard contains interactive filters such as:
14. Product Category
15. Region
16. Customer Type (New vs Returning)
17. Timeline (Date Filter)
    
### Dashboard Overview
<img width="901" height="506" alt="latest sales overview dashboard" src="https://github.com/user-attachments/assets/9403a959-8b0c-41ce-98b4-e7304004ec95" />

### Key Insights
##### Sales by Region:
1. Southeast generated the highest sales, while North Central recorded the lowest sales.
##### Sales Trends:
2. Sales peaked in the month of December, indicating strong seasonal performance.
##### Sales by Product Category:
3. Home Appliances recorded the highest sales, whereas Kitchen Appliances had the lowest sales.
##### Top 5 Products by Revenue:
4. Refrigerator generated the highest revenue, followed by Telephone, Jeans, Fan, and Smartphones.
##### Discount vs Revenue:
5. Revenue was highest at 0% discount and lowest at 20% discount, indicating that higher discounts 
did not drive increased revenue.
##### Age Group Analysis:
6. Customers within the 6–8 years age group contributed the highest purchases.
##### Order Status Analysis:
* Delivered Orders: 54%

* Returned Orders: 39%

* Cancelled Orders: 7%

This shows a relatively high return rate compared to completed deliveries.

### Recommendations
##### Focus on High-Performing Regions:

* Increase investment and marketing efforts in the Southeast while developing strategies to boost sales in North Central.

##### Leverage Seasonal Trends:

* Maximize sales during peak periods like December through targeted promotions and inventory planning.

##### Promote High-Performing Products:

* Prioritize products like Refrigerators and Telephones in marketing campaigns and ensure consistent stock availability.

##### Re-evaluate Discount Strategy:

* Since higher discounts do not increase revenue, consider reducing discount rates and focusing on value-based pricing.

##### Improve Low-Performing Categories:

* Investigate why Kitchen Appliances are underperforming and implement strategies such as bundling or targeted promotions.

##### Address High Return Rates:

* Analyze reasons for product returns and improve product quality, descriptions, or delivery processes to reduce return rates.

##### Target Key Customer Segments:

* Focus marketing efforts on the most active age group while exploring ways to engage other age segments.


### Future Works

##### To enhance the effectiveness and scalability of this project, the following improvements are proposed:

* Automate Data Pipelines:  Integrate ETL tools such as Power Query or Python to automate data cleaning and transformation.
* Enhance Predictive Analytics:  Implement forecasting models to predict future sales trends and revenue.
* Integrate Advanced SQL Queries:  Use stored procedures, views, and window functions for deeper analytical insights.
* Improve Dashboard Interactivity:  Add drill-through features, tooltips, and dynamic parameters in Power BI.
* Deploy the Power BI Dashboard Online:  Publish the dashboard to Power BI Service for broader accessibility.
* Add Geospatial Analysis:  Introduce map visualizations to analyze regional sales distribution.
* Optimize Performance:  Improve data model efficiency through normalization and indexing.




Data Source

[Download Here](https://github.com/amarachiokpala53-del/Sales-Overview-and-Trends-Dashboard/blob/main/Sales%20dataset%20excel%20github.xlsx)
[Download Here](https://github.com/amarachiokpala53-del/Sales-Overview-and-Trends-Dashboard/blob/main/POWER%20BI%20sales_dataset.pbix)

