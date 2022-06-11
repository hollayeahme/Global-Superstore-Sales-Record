## Preview the Data
SELECT * FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details;

## Remove Postal_Code column from the table cause it contains null values and it is irrelevant to the analysis. The dataset is then saved as 1
ALTER TABLE data-analysis-projects-351522.Global_Superstore.global_superstore_details DROP COLUMN Postal_Code;

## Preview the new dataset - global_superstore_details_1
SELECT * FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Check the number of distinct values in some columns
## Row_ID to get the number of total records
SELECT COUNT (DISTINCT Row_ID)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Product Category
SELECT COUNT (DISTINCT Category)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Product Sub_Category
SELECT COUNT (DISTINCT Sub_Category)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Product Name
SELECT COUNT (DISTINCT Product_Name)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Customer Segment
SELECT COUNT (DISTINCT Segment)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Customer Name
SELECT COUNT (DISTINCT Customer_Name)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details;

## Number of distinct Customer ID
SELECT COUNT (DISTINCT Customer_ID)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Order ID
SELECT COUNT (DISTINCT Order_ID)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Country
SELECT COUNT (DISTINCT Country)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Region
SELECT COUNT (DISTINCT Region)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Number of distinct Market
SELECT COUNT (DISTINCT Market)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_1;

## Remove duplicate from the table
SELECT DISTINCT *
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details;

## Find what categories of items have the most orders and generate more profit
SELECT Category, 
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Profit) AS Sum_of_Profit, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Category
ORDER BY SUM(Profit) DESC;

## Create a new table for the dataset containing details of highest ordered category and most profitable
CREATE OR REPLACE TABLE data-analysis-projects-351522.Generated_Datasets.global_superstore_Category_details
AS
SELECT Category, 
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Profit) AS Sum_of_Profit, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Category
ORDER BY SUM(Profit) DESC;

## Find what categories of items per Country have the most orders and generate more profit
SELECT Category, Country,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Profit) AS Sum_of_Profit, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Category, Country
ORDER BY SUM(Profit) DESC;

## Create a new table for the dataset containing details of highest ordered category and most profitable per Country
CREATE OR REPLACE TABLE data-analysis-projects-351522.Generated_Datasets.global_superstore_Category_per_Country_details
AS
SELECT Category, Country,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Profit) AS Sum_of_Profit, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Category, Country
ORDER BY SUM(Profit) DESC;

## Find what sub categories of items have the most orders and generate more profit
SELECT Category, Sub_Category,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Profit) AS Sum_of_Profit, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Category, Sub_Category
ORDER BY Category DESC;

## Create a new table for the dataset containing details of highest/lowest ordered sub category and most/least profitable
CREATE OR REPLACE TABLE data-analysis-projects-351522.Generated_Datasets.global_superstore_Sub_Category_details
AS
SELECT Category, Sub_Category,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Profit) AS Sum_of_Profit, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Category, Sub_Category
ORDER BY Category DESC;

## Find what countries generate most profit
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Profit) DESC
LIMIT 20;

## Create a new table for the dataset containing details of countries generating most profit
CREATE OR REPLACE TABLE data-analysis-projects-351522.Generated_Datasets.global_superstore_most_profitable_countries
AS
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Profit) DESC
LIMIT 20;

## Find what countries generate least profit
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Profit) ASC
LIMIT 20;

## Create a new table for the dataset containing details of countries generating least profit
CREATE OR REPLACE TABLE data-analysis-projects-351522.Generated_Datasets.global_superstore_least_profitable_countries
AS
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Profit) DESC
LIMIT 20;

## Find what countries have highest sales
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Sales) DESC
LIMIT 20;

## Create a new table for the dataset containing details of countries that made highest sales profit
CREATE OR REPLACE TABLE data-analysis-projects-351522.Generated_Datasets.global_superstore_highest_sales_countries
AS
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Sales) DESC
LIMIT 20;

## Find what countries have least sales
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Sales) ASC
LIMIT 20;

## Create a new table for the dataset containing details of countries that made highest sales profit
CREATE OR REPLACE TABLE data-analysis-projects-351522.Generated_Datasets.global_superstore_least_sales_countries
AS
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
SUM(Profit_Margin) AS Sum_of_Profit_Margin
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Sales) ASC
LIMIT 20;

## Find the average discount per country to gain more insight to cause of loss for countries making good sales
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
AVG(Discount) AS Avg_Discount
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Profit) ASC
LIMIT 20;

## Find the maximum Discount to compare with the discounts for loss making countries
SELECT MAX(Discount)
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2;

## Still gaining more insights by finding average discounts for countries with lowest sales
SELECT Country,  
SUM(Profit) AS Sum_of_Profit,
SUM(Quantity) AS Sum_of_Quantity, 
SUM(Sales) AS Sum_of_Sales,
AVG(Discount) AS Avg_Discount
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Country
ORDER BY SUM(Sales) ASC
LIMIT 20;

## Find which shipping mode mostly used by customers
SELECT Ship_Mode, COUNT(Ship_Mode) AS Count_of_Ship_Mode,
COUNT (Ship_Mode)* 100.00 / SUM(COUNT(Ship_Mode)) OVER () AS Percentage_of_Ship_Mode
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Ship_Mode;

## Find which customer segment is most profitable?
SELECT Segment, SUM (Profit) AS Sum_of_Profit,
SUM (Profit)*100.00 / SUM(SUM(Profit)) OVER () AS Percentage_of_Profit
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Segment;

## Find which region is most profitable
SELECT Region, SUM (Profit) AS Sum_of_Profit,
SUM (Profit) * 100.00 / SUM(SUM(Profit)) OVER () AS Percentage_of_Profit
FROM data-analysis-projects-351522.Global_Superstore.global_superstore_details_2
GROUP BY Region
ORDER BY SUM(Profit) DESC

