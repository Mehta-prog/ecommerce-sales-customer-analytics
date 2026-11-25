🛒 E-Commerce Sales & Customer Analytics Dashboard

A relational SQL data warehouse and interactive BI reporting platform built with MySQL and Tableau

Show Image Show Image Show Image Show Image Show Image

B.Tech CSE Project-1 · Medicaps University, Indore

</div>
📌 Overview

Online marketplaces store sales data across many linked tables. Joined carelessly, those tables duplicate rows and inflate order counts, and totals alone hide how differently one-time and repeat customers behave.

This project turns the Brazilian E-Commerce Public Dataset by Olist into a trustworthy analytics pipeline:

🗄️ A normalized MySQL database (ecommerce_analytics)
🔍 Grain-safe SQL and four reusable analytical views
📊 An executive Tableau dashboard covering sales, retention, products and delivery
✨ Headline Results
Metric	Value
💰 Total item revenue	13,591,643.70
👥 Unique customers	93,342
🔁 Repeat customers	2,800
📈 Repeat vs one-time spend per customer	1.89x (260.05 vs 137.96)
🧾 Median order value	86.90
🛍️ Average items per order	1.1417
📦 Multi-product vs single-product AOV	199.84 vs 135.65
🚚 Late-delivery range across 17 states	5.00% (PR) to 19.69% (MA)
🖼️ Dashboard Preview

Add your Tableau screenshot here:

![Dashboard](images/dashboard.png)

The dashboard has five KPI cards (Total Revenue, Total Orders, Total Customers, Repeat Customers, Average Order Value) and five charts: monthly revenue, monthly orders, category revenue, RFM customer segments and late-delivery rate by state.

🏗️ Architecture
📁 Source LayerOlist CSV files
🗄️ Storage LayerMySQL:ecommerce_analytics
🔍 Analytical Layer4 reusable SQL views
📊 Presentation LayerTableau dashboard
🧩 Data Model
places
contains
referenced by
CUSTOMERS
string
customer_id
PK
string
customer_unique_id
string
customer_city
string
customer_state
ORDERS
string
order_id
PK
string
customer_id
FK
string
order_status
datetime
purchase_and_delivery_dates
ORDER_ITEMS
string
order_id
PK
int
order_item_id
PK
string
product_id
FK
decimal
price
PRODUCTS
string
product_id
PK
string
product_category_name
🔎 SQL Analytical Views
View	What it provides
vw_monthly_sales	Monthly revenue, distinct orders and AOV
vw_customer_rfm	Per-customer Recency, Frequency, Monetary values, repeat flag and 7-tier segment
vw_category_performance	Category revenue and one-time vs repeat spend per customer
vw_delivery_performance	State-level delivered orders, late orders and late rate (≥ 500 delivered orders)
🛡️ Grain-safe aggregation

Joining orders to order items repeats order-level rows. The project follows two rules:

Order and customer counts use COUNT(DISTINCT ...)
Revenue uses SUM(order_items.price) at item level
📊 Key Findings
<details> <summary><b>🔁 One-time vs repeat customers</b></summary>
Group	Customers	Revenue	Avg per customer
One-time	90,542	12,490,909.63	137.96
Repeat	2,800	728,136.05	260.05
</details> <details> <summary><b>🎯 RFM customer segments</b></summary>
Segment	Customers	Share
New Customers	36,983	39.62%
Need Attention	34,382	36.84%
Lost Customers	20,170	21.61%
Potential Loyalists	1,112	1.19%
At Risk	496	0.53%
Loyal Customers	160	0.17%
Champions	33	0.04%
</details> <details> <summary><b>🏷️ Top categories by revenue</b></summary>
Category	Revenue
beleza_saude	1,233,131.72
relogios_presentes	1,165,898.98
cama_mesa_banho	1,023,300.77

Strongest repeat-buyer uplift: informatica_acessorios (+66.20%), cama_mesa_banho (+49.02%), esporte_lazer (+45.30%).

</details> <details> <summary><b>🚚 Delivery performance by state (≥ 500 delivered orders)</b></summary>
Highest late rate	Late %	Lowest late rate	Late %
MA	19.69%	PR	5.00%
CE	15.34%	MG	5.61%
BA	14.04%	SP	5.89%
RJ	13.48%	DF	7.07%
PA	12.37%	RS	7.15%
</details>
🧰 Tech Stack
Tool	Purpose
MySQL 8.0+ / Workbench	Storage, validation and SQL views
SQL	Joins, RFM logic, KPI definitions
Tableau Desktop / Public	Interactive dashboard
Olist dataset (Kaggle)	Source data
🚀 Getting Started
Install MySQL Server 8.0+, MySQL Workbench and Tableau Desktop.
Download the Olist dataset from Kaggle.
Create the database and tables
sql
CREATE DATABASE ecommerce_analytics;

then run the DDL scripts for customers, orders, order_items and products. 4. Import the four CSV files and add primary and foreign key indexes. 5. Create the views in this order: vw_monthly_sales, vw_customer_rfm, vw_category_performance, vw_delivery_performance. 6. Open the Tableau workbook, connect to MySQL (127.0.0.1:3306), refresh the data and check the KPI totals.

✅ Validation

The project was checked with an 8-point SQL-to-Tableau plan: table loading, view compilation, key alignment, distinct-count safety, revenue total (13,591,643.70), KPI agreement between MySQL and Tableau, the 17-state delivery filter, and segment colours and labels.

⚠️ Limitations
Historical public data, not a live marketplace feed
Revenue is gross item price, not profit
Repeat behaviour is bounded by the dataset's observation window
Correlations and state differences are descriptive, not causal
🔭 Future Scope
💵 Profit and contribution-margin analysis
📅 Monthly cohort retention analysis
🤖 Churn, repeat-purchase and revenue forecasting models
🛒 Market-basket association rules and recommendations
🚛 Seller-level and carrier SLA analytics
☁️ Automated refresh and Tableau Server / Cloud deployment
📚 References
Olist, Brazilian E-Commerce Public Dataset, Kaggle
Oracle, MySQL 8.0 Reference Manual
Tableau, Tableau Help
S. Few, Information Dashboard Design
E. R. Tufte, The Visual Display of Quantitative Information
👤 Author

Ashutosh Mehta · EN23CS301214 B.Tech Computer Science & Engineering, Medicaps University, Indore Guide: Dr. Rohit Gupta
