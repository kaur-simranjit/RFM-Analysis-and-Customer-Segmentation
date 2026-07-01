# RFM Analysis and Customer Segmentation Using SQL and Power BI

RFM stands for recency, frequency, and monetary value and it is a data driven customer behavior segmentation technique. The idea is to segment customers based on when their last purchase was (recency), how often they've purchased in the past (frequency), and how much they've spent overall (monetary value).

By using this technique, we can target customers better which will help in number of things such as increase in customer retention which further increase company's revenue, improve marketing strategies by focusing on specific customer segment, and reduce churn rate.

### Tech Used

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

- **SQL** (for analysis)

  SQL Skills Used: Window Functions - Analytical Functions, Common Table Expressions, Subqueries, Joins, Views, Aggregate Functions, String       Functions, Scalar Functions, Date and Time Functions, Conditional Functions, Conversion Functions
- **Power BI** (for data visualization)

### Detailed Explanation

##### Step 1: Choose a Dataset
To perform RFM Analysis and Customer Segmentation, we need a dataset that includes customer id, transaction date, and transaction amount.

Dataset: https://statso.io/rfm-analysis-case-study/ 

**Note:** The dataset choosen for this project is public, however it is no longer available in the original source.

##### Step 2: Import the Data

<img width="491" height="178" alt="Screenshot 2026-07-01 at 7 05 44 PM" src="https://github.com/user-attachments/assets/aa16fcda-1b5f-49bc-bd01-80cbb7148134" />

The data is loaded into the MySQL database (projects).
Viewing first 10 rows of the table:

<img width="923" height="361" alt="Screenshot 2026-07-01 at 6 46 57 PM" src="https://github.com/user-attachments/assets/3ca12290-30f0-466d-b60a-d3091eb9e7ec" />

##### Step 3: Clean the Data

<img width="789" height="344" alt="Screenshot 2026-07-01 at 7 06 36 PM" src="https://github.com/user-attachments/assets/204ca6ce-f5c7-497e-ac1b-e41575b626ed" />

The datatype of column "PurchaseDate" is changed from "TEXT" to "DATE", and the datatype of column "TransactionAmount" is changed to "DECIMAL" for exact numeric representation.
Datatype changes were verified using INFORMATION_SCHEMA.COLUMNS.

<img width="348" height="103" alt="Screenshot 2026-07-01 at 6 50 08 PM" src="https://github.com/user-attachments/assets/8b9a1b9a-870d-409a-b8e7-bc59463a3e08" />

<img width="349" height="103" alt="Screenshot 2026-07-01 at 6 50 23 PM" src="https://github.com/user-attachments/assets/6aa99d9a-ed9f-4d81-9d7f-2b6b419b40f5" />

##### Step 4: Exploratory Data Analysis (EDA)

###### Number of rows and columns

<img width="300" height="113" alt="Screenshot 2026-07-01 at 7 07 51 PM" src="https://github.com/user-attachments/assets/e10d735a-14ac-42ee-9071-15766c759211" />

<img width="300" height="113" alt="Screenshot 2026-07-01 at 6 51 08 PM" src="https://github.com/user-attachments/assets/e805009d-cedc-41b8-8fcc-9657db3bb285" />

<img width="300" height="113" alt="Screenshot 2026-07-01 at 6 51 46 PM" src="https://github.com/user-attachments/assets/3541706c-9b6c-45d1-96a6-ac7871d5e21d" />

###### Checking for unique values

<img width="680" height="87" alt="Screenshot 2026-07-01 at 7 08 38 PM" src="https://github.com/user-attachments/assets/784b2348-6926-4fd7-85a7-42d0bd1a8bb0" />

OrderId was checked to confirm it is unique across the dataset.

<img width="469" height="100" alt="Screenshot 2026-07-01 at 6 52 02 PM" src="https://github.com/user-attachments/assets/300c0390-d3c9-41ea-9f7d-82e63c62980c" />

###### Identifying null values

<img width="304" height="80" alt="Screenshot 2026-07-01 at 7 09 13 PM" src="https://github.com/user-attachments/assets/5fa1ec4e-9763-4504-b67a-42952690df61" />

Checked for null values in the Location column.

<img width="947" height="119" alt="Screenshot 2026-07-01 at 6 52 32 PM" src="https://github.com/user-attachments/assets/4b104e8b-fdcf-4eab-8d65-5cb4e566bd6d" />

There are no null values in the data.

###### Answering some questions

**Q1. What is the total number of customers, orders, and sales?**

<img width="561" height="107" alt="Screenshot 2026-07-01 at 6 55 03 PM" src="https://github.com/user-attachments/assets/3da50eeb-bbe4-4d74-ba5d-2a18252e37c3" />

**Q2. Which day has the most sales?**

<img width="342" height="423" alt="Screenshot 2026-07-01 at 6 57 49 PM" src="https://github.com/user-attachments/assets/bff7c624-7b44-45e6-b9d9-f5ace3add936" />

**Q3. Which day has the most orders?**

<img width="342" height="419" alt="Screenshot 2026-07-01 at 6 58 22 PM" src="https://github.com/user-attachments/assets/edd87671-2a02-4d9c-9246-3e8e302e0c11" />

**Q4. Which cities have higher customer base?**

<img width="369" height="199" alt="Screenshot 2026-07-01 at 6 58 43 PM" src="https://github.com/user-attachments/assets/bff1a4c5-6e9d-4867-960c-e16ec7afabed" />

**Q5. Which cities have the most orders?**

<img width="332" height="206" alt="Screenshot 2026-07-01 at 6 59 06 PM" src="https://github.com/user-attachments/assets/7061bdd1-82bd-4c7f-89d2-6a46c55cdfb3" />

**Q6. Which cities have the most sales and in which month?**

<img width="418" height="431" alt="Screenshot 2026-07-01 at 6 59 25 PM" src="https://github.com/user-attachments/assets/0f854b2c-1c93-4e99-a2af-6f947cf65904" />

**Q7. Which products have the most orders?**

<img width="334" height="206" alt="Screenshot 2026-07-01 at 6 59 58 PM" src="https://github.com/user-attachments/assets/c87a0e50-bf10-47dc-aa7f-54e1b1972388" />

**Q8. Which products have the most sales and in which month?**

<img width="425" height="428" alt="Screenshot 2026-07-01 at 7 00 16 PM" src="https://github.com/user-attachments/assets/f5018632-3410-4718-a5e7-fac34ff3474a" />

##### Step 5: Prepare Data for RFM Analysis
Only the columns needed for analysis (customer_id, order_id, purchase_date, amount) were selected into a new table, order_data, with purchase_date and amount converted to DATE and DECIMAL respectively.

<img width="843" height="272" alt="Screenshot 2026-07-01 at 7 13 02 PM" src="https://github.com/user-attachments/assets/970728ee-846a-41e2-9fd0-269bee3d4333" />

##### Step 6: Calculate RFM Values and Scores
Using a Common Table Expression (CTE) and SQL window functions, Recency, Frequency, and Monetary values were calculated per customer, then scored on a scale of 1–3 using NTILE(). Scores were combined into an RFM code and averaged to produce an overall avg_rfm_score, stored as the view rfm_analysis.

<img width="1100" height="312" alt="Screenshot 2026-07-01 at 7 15 03 PM" src="https://github.com/user-attachments/assets/fd06f481-ebd0-463d-916f-697343f50c7a" />

<img width="1100" height="150" alt="Screenshot 2026-07-01 at 7 15 54 PM" src="https://github.com/user-attachments/assets/81fa9921-b7bc-471a-a85a-9797918948ba" />

##### Step 7: Value and Customer Segmentation
Using the rfm_analysis view, customers were classified into value segments (High, Mid, Low) based on avg_rfm_score, and further into customer segments (Champion, Loyal, Regular, At-risk, Lost) based on their specific RFM code — stored as the view customer_segmentation.

<img width="1423" height="430" alt="Screenshot 2026-07-01 at 7 17 56 PM" src="https://github.com/user-attachments/assets/0d187c0c-3760-4574-8ed6-b9e50485484d" />

##### Step 8: Segment Distribution

<img width="439" height="171" alt="Screenshot 2026-07-01 at 7 18 44 PM" src="https://github.com/user-attachments/assets/6bfe7dbb-1b1f-44a5-b8fc-1374f4bce727" />

We have highest mid value customers. 

<img width="489" height="228" alt="Screenshot 2026-07-01 at 7 19 30 PM" src="https://github.com/user-attachments/assets/e6e2cd99-b004-432d-8f6b-1f8f8bed731e" />

We have highest regular customers.

<img width="621" height="328" alt="Screenshot 2026-07-01 at 7 19 55 PM" src="https://github.com/user-attachments/assets/cf8af4c4-8ea9-4458-bcbd-22db960944f7" />

- Champion customers are distributed among high value customers.
- Loyal customers are distributed among high value & mid value customers, mid value segment has the maximum loyal customers.
- At-risk customers are distributed among mid value & low value customers, low value segment has the maximum at-risk customers.
- Lost customers are distributed among low value customers.
- Regular customers are distributed among mid value & low value customers, mid value segment has the maximum regular customers.
- 53% of high value segment customers are the loyal customers.
- 52% of low value segment customers are the at-risk customers.
- 59% of mid value segment customers are the regular customers.

##### Step 9: Revenue and Recency by Segment

<img width="598" height="228" alt="Screenshot 2026-07-01 at 7 22 07 PM" src="https://github.com/user-attachments/assets/3126332b-9513-4016-a01c-2c7dce575d09" />

**Loyal Customers** generate the highest total revenue of any segment ($167.3K, 32.6% of total revenue).

<img width="663" height="235" alt="Screenshot 2026-07-01 at 7 22 24 PM" src="https://github.com/user-attachments/assets/225a9908-ce18-47d9-a5ee-71965671f089" />

**At-risk Customers** (210) show the second-highest recency gap at approximately 49.6 days since last purchase, representing $142.8K (27.8%) of revenue — a clear retention priority.

##### Step 10: Segment Comparison by RFM Score
Average recency, frequency, and monetary scores were compared across customer segments to validate segment behavior patterns.

<img width="770" height="212" alt="Screenshot 2026-07-01 at 7 23 10 PM" src="https://github.com/user-attachments/assets/30f0f1fc-c758-4582-a4a7-e93a05d03524" />

### Power BI Dashboard

<img width="1069" height="726" alt="Screenshot 2026-07-01 at 7 37 55 PM" src="https://github.com/user-attachments/assets/ccfb1e96-bf7a-4489-8552-bf1d439bc5f5" />



