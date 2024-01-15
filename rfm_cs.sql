/*
									RFM ANALYSIS | CUSTOMER SEGMENTATION 
*/

-- select database
USE projects;

-- view table
SELECT * FROM rfm_data 
LIMIT 10;

-- changing the datatype of column "PurchaseDate" from text to date
ALTER TABLE rfm_data 
MODIFY COLUMN PurchaseDate DATE;

-- changing the datatype of column "TransactionAmount" from double to decimal
ALTER TABLE rfm_data 
MODIFY COLUMN TransactionAmount DECIMAL(10,2);

-- verifying if the datatypes are changed
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'projects' AND TABLE_NAME = 'rfm_data'AND COLUMN_NAME = 'PurchaseDate';
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'projects' AND TABLE_NAME = 'rfm_data'AND COLUMN_NAME = 'TransactionAmount';

-- view number of columns and rows
SELECT COUNT(*) AS number_of_rows 
FROM rfm_data;
SELECT COUNT(*) AS number_of_columns 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'rfm_data';

-- checking for distinct values for column "OrderId" as it has to be unique
SELECT COUNT(OrderId) AS total_order_ids, COUNT(DISTINCT(OrderId)) AS unique_order_ids
FROM rfm_data;

-- checking for null values
SELECT * FROM rfm_data 
WHERE Location IS NULL;

-- Now, we will answer some questions.
/* Q1. What is the total number of customers, orders, and sales? */
SELECT COUNT(DISTINCT CustomerId) AS total_customers, COUNT(OrderID) AS total_orders, SUM(TransactionAmount) AS total_sales 
FROM rfm_data; 

/* Q2. Which day has the most sales? */
SELECT PurchaseDate AS day, SUM(TransactionAmount) AS total_sales
FROM rfm_data 
GROUP BY PurchaseDate
ORDER BY 2 DESC;

/* Q3. Which day has the most orders? */
SELECT PurchaseDate AS day, COUNT(OrderID) AS total_orders
FROM rfm_data 
GROUP BY PurchaseDate
ORDER BY 2 DESC;

/* Q4. Which cities have higher customer base? */
SELECT Location AS city, COUNT(DISTINCT CustomerId) AS number_of_customers 
FROM rfm_data 
GROUP BY Location
ORDER BY 2 DESC;

/* Q5. Which cities have the most orders? */
SELECT Location AS city, COUNT(OrderID) AS total_orders
FROM rfm_data 
GROUP BY Location 
ORDER BY 2 DESC;

/* Q6. Which cities have the most sales and in which month? */
SELECT MONTH(PurchaseDate) AS month, Location AS city, SUM(TransactionAmount) AS total_sales
FROM rfm_data 
GROUP BY 1, 2
ORDER BY 1, 3;

/* Q7. Which products have the most orders? */
SELECT ProductInformation as product, COUNT(OrderID) AS total_orders
FROM rfm_data 
GROUP BY ProductInformation 
ORDER BY 2 DESC;

/* Q8. Which products have the most sales and in which month? */
SELECT MONTH(PurchaseDate) AS month, ProductInformation as product, SUM(TransactionAmount) AS total_sales
FROM rfm_data 
GROUP BY 1, 2
ORDER BY 1, 3;

-- Here, we will take only those columns that we need for analysis
SELECT CustomerId AS customer_id, OrderId AS order_id, PurchaseDate AS purchase_date, TransactionAmount AS amount 
FROM rfm_data AS order_data;

-- changing the datatype of column "purchase_date" from text to date
ALTER TABLE order_data 
MODIFY COLUMN purchase_date DATE;

-- changing the datatype of column "amount" from double to decimal
ALTER TABLE order_data 
MODIFY COLUMN amount DECIMAL(10,2);

/* Now, first we will calculate rfm values, scores, and rfm score average.
   Then, store all these as a view to perform value and customer segmentation.
*/
-- drop view if exists
DROP VIEW IF EXISTS rfm_analysis;
-- create a view for rfm values, scores, and rfm score average
CREATE VIEW rfm_analysis AS
-- calculatng rfm values and scores
WITH rfm_values_scores AS
(
SELECT 
    o.customer_id,
    -- recency calculation using DATEDIFF and subqueries
    DATEDIFF((SELECT MAX(purchase_date) FROM order_data),
             (SELECT MAX(purchase_date) FROM order_data WHERE customer_id = o.customer_id)) AS recency,
    -- frequency calculation using COUNT
    COUNT(o.order_id) AS frequency,
    -- monetary value calculation using SUM
    SUM(o.amount) AS monetary_value,
    -- recency score calculation using NTILE over recency in descending order
    -- rfm score is on the scale of 1 to 3 as the dataset is small
    NTILE(3) OVER (ORDER BY DATEDIFF((SELECT MAX(purchase_date) FROM order_data),
                                     (SELECT MAX(purchase_date) FROM order_data WHERE customer_id = o.customer_id)) DESC) AS recency_score,
    -- frequency score calculation using NTILE over frequency in ascending order
    NTILE(3) OVER (ORDER BY COUNT(o.order_id) ASC) AS frequency_score,
    -- monetary score calculation using NTILE over monetary_value in ascending order
    NTILE(3) OVER (ORDER BY SUM(o.amount) ASC) AS monetary_score
FROM 
    order_data AS o
GROUP BY 
    o.customer_id 
ORDER BY 
    1, 3 DESC),
-- calculatng rfm score and average rfm score
rfm_average AS
(
SELECT 
	-- rfm score calculation using CONCAT
	customer_id, CONCAT(recency_score, frequency_score, monetary_score) AS rfm,
	-- calculating average rfm score using CAST
    CAST((recency_score + frequency_score + monetary_score)/3 AS DECIMAL(16,2)) AS avg_rfm_score 
FROM rfm_values_scores)
-- joining rfm_values_scores and rfm_average
Select 
	t1.customer_id, recency, frequency, monetary_value, recency_score, frequency_score, monetary_score, rfm, avg_rfm_score
FROM rfm_values_scores t1
JOIN rfm_average t2
ON t1.customer_id = t2.customer_id;
SELECT * FROM rfm_analysis ORDER BY avg_rfm_score;

-- calculating average of recency, frequency, and monetary value
SELECT ROUND(AVG(recency)) AS avg_recency, ROUND(AVG(frequency)) AS avg_frequency, ROUND(AVG(monetary_value)) AS avg_monetary_value
FROM rfm_analysis;

/* Now, we will calculate value and customer segments using view "rfm_analysis".
   Then, store all these as a view to get insights.
*/
-- drop view if exists
DROP VIEW IF EXISTS customer_segmentation;
-- create a view for value and customer segment
CREATE VIEW customer_segmentation AS
Select *, CASE 
WHEN avg_rfm_score >= 2.5 THEN 'high value'
WHEN avg_rfm_score >= 1.5 AND avg_rfm_score < 2.5 THEN 'mid value'
WHEN avg_rfm_score > 0 AND avg_rfm_score < 1.5 THEN 'low value'
END AS value_segment,
CASE 
WHEN rfm IN (333) THEN 'Champion Customers'
WHEN rfm IN (223, 232, 233, 322, 323, 332) THEN 'Loyal Customers'
WHEN rfm IN (211, 212, 213, 221, 222, 321, 331) THEN 'Regular Customers'
WHEN rfm IN (112, 113, 131, 133) THEN 'At-risk Customers'
WHEN rfm IN (111) THEN 'Lost Customers'
END AS customer_segment
FROM rfm_analysis;
-- view table
SELECT * FROM customer_segmentation ORDER BY avg_rfm_score;

/* Now, we will see how customers are distributed among value segments, customer segments, and both. */
-- Customers by value segment
SELECT value_segment, 
COUNT(customer_id) AS number_of_customers
FROM customer_segmentation
GROUP BY value_segment
ORDER BY number_of_customers;
-- We have highest mid value customers. 

-- Customers by customer segment
SELECT customer_segment,
COUNT(customer_id) AS number_of_customers
FROM customer_segmentation
GROUP BY customer_segment
ORDER BY number_of_customers; 
-- We have highest regular customers.

-- Customers by customer segment and value segment
SELECT value_segment, customer_segment,
COUNT(customer_id) AS number_of_customers
FROM customer_segmentation
GROUP BY customer_segment, value_segment
ORDER BY value_segment, number_of_customers DESC;
-- Champion customers are distributed among high value customers.
-- Loyal customers are distributed among high value & mid value customers, mid value segment has the maximum loyal customers.
-- At-risk customers are distributed among mid value & low value customers, low value segment has the maximum at-risk customers.
-- Lost customers are distributed among low value customers.
-- Regular customers are distributed among mid value & low value customers, mid value segment has the maximum regular customers.

-- 53% of high value segment customers are the loyal customers.
-- 52% of low value segment customers are the at-risk customers.
-- 59% of mid value segment customers are the regular customers.

-- Comparison of customer segments based on rfm scores
SELECT customer_segment, 
CAST(AVG(recency_score) AS DECIMAL(16,2)) AS recency_score, 
CAST(AVG(frequency_score) AS DECIMAL(16,2)) AS frequency_score, 
CAST(AVG(monetary_score) AS DECIMAL(16,2)) AS monetary_score
FROM customer_segmentation
GROUP BY customer_segment
ORDER BY 2, 3, 4 DESC;
