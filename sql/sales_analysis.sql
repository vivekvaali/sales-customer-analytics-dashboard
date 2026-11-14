-- Sales & Customer Analytics Dashboard
-- SQL analysis queries used in Sales_Customer_Analytics.ipynb
-- Database: SQLite | Table: sales

-- 1. Verify the number of records loaded into the sales table.
SELECT COUNT(*) AS total_records
FROM sales;

-- 2. Calculate overall business KPIs.
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    COUNT(DISTINCT "Customer Name") AS Unique_Customers,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin
FROM sales;

-- 3. Analyze product category performance.
SELECT
    "Product Category",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM("Order Quantity") AS Total_Quantity,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin
FROM sales
GROUP BY "Product Category"
ORDER BY Total_Sales DESC;

-- 4. Analyze regional sales performance.
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 5. Identify the top 10 customers by sales.
SELECT
    "Customer Name",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM sales
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Analyze monthly sales and profit trends.
SELECT
    "Order Year-Month",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY "Order Year-Month"
ORDER BY "Order Year-Month";
