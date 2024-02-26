# RFM Analysis and Customer Segmentation Using SQL and Power BI
<p>RFM stands for recency, frequency, and monetary value and it is a data driven customer behavior segmentation technique. The idea is to segment customers based on when their last purchase was (recency), how often they’ve purchased in the past (frequency), and how much they’ve spent overall (monetary value).</p>
<p>~ definition by blog.rsquaredacademy.com</p>
<p>By using this technique, we can target customers better which will help in number of things such as increase in customer retention which further increase company’s revenue, improve marketing strategies by focusing on specific customer segment, and reduce churn rate.</p>
<h3>Tech Used</h3>

![logo](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/9545a44f-d7cd-427b-ae34-7764624f1adc)
<br>
<ul style="list-style-type:disc">
<li><b>SQL</b> (for analysis)</li>
  SQL Skills Used: Window Functions - Analytical Functions, Common Table Expressions, Subqueries, Joins, Views, Aggregate Functions, String Functions, Scalar Functions, Date and Time Functions, Conditional Functions, Conversion Functions
<li><b>Power BI</b> (for data visualization)</li>
</ul>
<h3>Detailed Explanation</h3>
<h5>Step 1: Choose a Dataset</h5>
<p>To perform RFM Analysis and Customer Segmentation, we need a dataset that includes customer id, transaction date, and transaction amount.</p>
Dataset: https://statso.io/rfm-analysis-case-study/
<h5>Step 2: Import the Data</h5>
The data is loaded into the MySQL database. 
<br>
<br>

![1](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/5e3db520-1e43-4adf-b622-7d8a9ae081ec)
<br>
Viewing first 10 rows of the table:
<br>
<br>
![2](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/dd571005-e0d5-4040-8f87-c0ecf96096d5)
<h5>Step 3: Clean the Data</h5>
<p>The datatype of column “PurchaseDate” is “TEXT” which needs to be changed to datatype “DATE” and the datatype of column “TransactionAmount” is also changed to datatype “DECIMAL” as amount needs an exact representation.</p>
<br>

![3](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/a2062d69-9157-4e0c-86e5-0c9a6bd9a6ad)
<br>
<br>
![4](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/a587caa4-987f-492a-b3c4-31e4ceec6e96)
<h5>Step 4: Exploratory Data Analysis (EDA)</h5>
Now, we will explore the dataset to gather insights.
<br>
<h6>Number of rows and columns</h6>
<br>

![5](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/c19ebab0-2e80-474c-8e94-c826bb02e652)
<br>
<br>
![6](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/a3db2052-3202-49de-acea-61b4bc9630aa)
<br>
<br>
![7](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/43f4bfea-b38b-47be-bc97-b3737fbb9874)
<h6>Checking for unique values</h6>
<br>

![8](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/868570e8-ae30-45e6-acd6-0329e7f094ca)
<br>
<br>
![9](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/c2538dd7-6dc6-4909-8ee9-7f104000571f)
<h6>Identifying null values</h6>
<br>

![10](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/219b2c5d-a64b-4548-9631-d6da927b4f9a)
<br>
<br>
![11](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/a6e958a9-8e3c-4645-b247-75433d54089d)
<br>
There are no null values in the data.
<h6>Answering some questions</h6>
<b>Q1. What is the total number of customers, orders, and sales?</b>
<br>
<br>

![12](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/df5cae4a-073c-4c3a-b7e5-1ff7ac81b7bc)
<br>
<br>
![13](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/2ba3f215-02a4-4f78-ac27-352ccedd326a)
<br>
<b>Q2. Which day has the most sales?</b>
<br>

![14](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/4ca66499-bdbe-48d7-9043-cd058df0802e)
<br>
<br>
![15](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/c0c11f2e-8501-4687-8c58-0bdf6c42c5eb)
<br>
<br>
<b>Q3. Which day has the most orders?</b>
<br>

![16](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/79d31f6e-4b4b-44e9-9575-7683985828cf)
<br>
<br>
![17](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/4ec20fa2-8d69-4a52-ab12-6227c8809162)
<br>
<br>
<b>Q4. Which cities have higher customer base?</b>
<br>

![18](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/c347519c-55da-4b1a-be66-a215633af4ce)
<br>
<br>
![19](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/4be4f27d-6ae8-454d-83b0-a54868c5cb15)
<br>
<br>
<b>Q5. Which cities have the most orders?</b>
<br>

![20](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/4d131020-10de-41fc-a112-6ba01eeaf694)
<br>
<br>
![21](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/00664f70-739b-4076-9b7b-71ee4b7d5358)
<br>
<br>
<b>Q6. Which cities have the most sales and in which month?</b>
<br>

![22](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/21fd3fc6-851e-463a-8adc-0ca53924bd18)
<br>
<br>
![23](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/5fb66ee5-b3a0-426c-bf25-454cc07a8071)
<br>
<br>
<b>Q7. Which products have the most orders?</b>
<br>

![24](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/5cb71a09-0786-44a8-be37-fbe2590abf5b)
<br>
<br>
![25](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/49077c78-a948-408e-9fb9-9fd20f8c9bdf)
<br>
<br>
<b>Q8. Which products have the most sales and in which month?</b>
<br>
<br>
![26](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/a24c780f-8560-4e72-b89b-7ee7ed23192a)
<br>
<br>
![27](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/694abe20-7f65-4ef4-91b9-75009f46628b)

<h5>Step 5: RFM Analysis and Customer Segmentation</h5>
<p>Here, we will first calculate recency, frequency, and monetary values, and assign scores. Then, segment the customers based on RFM scores.</p>
<h6>RFM Values and Scores Calculation</h6>

![28](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/7b97fe38-f69d-4a91-b4ea-16d3ec0953c1)
<br>
![29](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/aeddf702-5d01-4f7b-9c56-2fa23e2ddf01)
<br>
![30](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/f77ad017-c2fe-4370-9960-213e40318d6d)
<br>
<br>
![31](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/40b6bad4-2520-462d-b5d7-daf8e1bdcdbe)
<h6>Checking for Average Recency, Frequency, and Monetary Values</h6>

![32](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/c4f978da-ffef-414d-aabb-ad542b106aaa)
<br>
<br>
![33](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/cc76648d-9d54-4b6c-a26c-e48f01f76cc1)
<h6>Customer Segmentation</h6>
Value Segment: We can divide customers into 3 value segments which are as follows:
<br>
<ul style="list-style-type:disc">
<li>High Value: Customers with highest recency, frequency, and monetary value.</li>
<li>Mid Value: Right in the center of everything. Customers who are fairly frequent, and spend moderate money.</li> 
<li>Low Value: Customers who are not frequent buyers, and contribute very little.</li>
</ul>
Customer Segment: We can divide customers into different customer segments based on RFM scores. I have considered the following customer segments:
<ul style="list-style-type:disc">
<li>Champion Customers: Customers who has purchased recently, has frequent transactions, and has spent a lot.</li>
<li>Lost Customers: Customers who has lowest recency, frequency, and monetary scores.</li>
<li>At-risk Customers: Customers who has spent good money and purchased often, however they have not purchased for a long time.</li>
<li>Loyal Customers: Customers who has spent good amount of money.</li>
<li>Regular Customers: Customers who do consistent purchases but may not have the highest monetary value.</li> 
</ul>
<br>

![34](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/8c21e424-ef69-4ed9-9e00-9d9bb26e4583)
<br>
<br>
![35](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/ef6a0470-fdda-4357-b5c6-296eb8e7b6f8)
<h5>Insights</h5>
Now, we will see how customers are distributed among different segments.
<h6>Customers by Value Segment</h6>

![36](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/77ef4fc3-9c47-4ba5-b571-e4d4f786e42b)
<br>
<br>
![37](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/37a2d2ab-7849-45d3-ac98-c1389229ad3b)
<br>
We have highest mid value customers.
<h6>Customers by Customer Segment</h6>

![38](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/b25ecb3e-9cf0-4459-89e3-a2385b292979)
<br>
<br>
![39](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/0fa34e17-ae7e-4027-b4bc-9ccef87df152)
<br>
We have highest regular customers.
<h6>Customers by Customer Segment and Value Segment</h6>

![40](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/b5808152-adf9-4122-8594-d304d74fb48f)
<br>
<br>
![41](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/ae296df0-84d8-42d1-87e2-0e7ede9f9d1e)
<br>
<ul style="list-style-type:disc">
<li>Champion customers are distributed among high value customers.</li>
<li>Loyal customers are distributed among high value & mid value customers, mid value segment has the maximum loyal customers.</li>
<li>At-risk customers are distributed among mid value & low value customers, low value segment has the maximum at-risk customers.</li>
<li>Lost customers are distributed among low value customers.</li>
<li>Regular customers are distributed among mid value & low value customers, mid value segment has the maximum regular customers.</li>
<li>53% of high value segment customers are the loyal customers.</li>
<li>52% of low value segment customers are the at-risk customers.</li>
<li>59% of mid value segment customers are the regular customers.</li>
</ul>
<h6>Comparison of Customer Segments based on RFM scores</h6>

![42](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/cd2e81e4-2836-4578-b865-470e0ee212d6)
<br>
<br>
![43](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/259f6cca-fcbf-465b-b6c7-f9e68c6f70ae)
<h5>Data Visualization</h5>
POWER BI is used for visualization of the above insights:
<br>
<br>

![rfm_dashboard](https://github.com/kaur-simranjit/RFM-Analysis-and-Customer-Segmentation/assets/109523596/a83eb183-fe89-4e28-a561-b1161edea9ef)
<h5>Recommendations</h5>
<ul style="list-style-type:disc">
<li>Champion Customers: We can give them discounts for multiple purchases and early access to new products.</li>
<li>Lost Customers: To get them back, we can do promotions such as personalized emails or messages. Also, a survey would be a great to option to know the reasons for not purchasing products anymore so that we can resolve the issues.</li> 
<li>At-risk Customers: We can do promotions to reach out to them and give them special offers to prevent churn rate.</li>
<li>Loyal Customers: We can create a loyalty program for them to maintain their relationship with the company in which if they earn certain points, they can get a discount on number of products.</li>
<li>Regular Customers: We can do occasional promotions to encourage repeat business.</li>
</ul>

<h5>References</h5>
<ul style="list-style-type:disc">
<li>https://github.com/AyushiAsthana18/RFM-Analysis</li></ul>

