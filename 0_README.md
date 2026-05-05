# Procurement Data Analysis Report
1. Data Preparation

To ensure the accuracy and reliability of the analysis, the dataset was first cleaned and structured:

Created a staging table to preserve the raw dataset
Removed duplicates using ROW_NUMBER()
Standardized data using UPDATE and WHERE clauses
Handled missing (null) values appropriately
Added a new column to calculate delivery time (difference between order date and delivery date)
2. Key Findings
Total Procurement Spend

The total amount spent on procurement is:

$45,373,696

The supplier with the highest spend is Epsilon Group with $9,851,156.06
The supplier with the lowest spend is Beta Supplies with $9,858,665.90



Supplier Performance (Delivery Time)
The fastest supplier is Gamma Co, with an average delivery time of 10 days across all product categories
Procurement Volume by Year

2022:

Top supplier: Gamma Co with 89,118 items supplied
Lowest supplier: Alpha Inc with 75,130 items supplied

2023:

Top supplier: Beta Supplies with 96,920 items supplied
Lowest supplier: Gamma Co with 67,556 items supplied
Price Trend Analysis
In 2022, unit prices remained relatively stable throughout the year
Starting from January 2023, Gamma Co’s prices increased significantly, creating a large gap compared to other suppliers

This price increase likely explains the drop in quantity ordered from Gamma Co in 2023, as the company shifted demand to more cost-effective suppliers

3. Key Insights & Recommendations
There is a trade-off between cost and performance:
Gamma Co is the fastest supplier but became less competitive due to price increases
The company appears to optimize procurement by shifting volume toward lower-cost suppliers
Monitoring price fluctuations and supplier performance together is essential for better decision-making

Recommendations:

Negotiate pricing with high-performing but expensive suppliers like Gamma Co
Maintain a balance between cost efficiency and delivery speed
Implement a supplier performance dashboard combining cost, delivery time, and reliability
