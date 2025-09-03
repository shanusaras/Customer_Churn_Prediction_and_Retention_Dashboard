Customer Churn Analysis — SQL | Python | Tableau
🔹 Problem Statement

E-commerce platforms silently lose customers every month, and retaining them has a direct revenue impact. Research shows that improving customer retention by just 5% can increase revenue by 20–30%.

This project analyzes the Olist Brazil E-commerce dataset to identify customer churn drivers, design churn prediction features, and build a dashboard for actionable retention strategies.

🔹 Objectives

Define churn for e-commerce customers (e.g., inactive for 6+ months).

Segment customers by demographics, order frequency, and spend.

Identify patterns of churn and retention.

Build KPIs and dashboards to help business stakeholders act on churn risks.

Lay foundation for predictive churn modeling.

🔹 Dataset

Source: Olist E-commerce Public Dataset

Size: ~100k+ orders across multiple tables

Key tables:

customers.csv – customer IDs, geolocation

orders.csv – order status, purchase & delivery dates

order_items.csv – products, price, freight value

order_payments.csv – payment types & installments

order_reviews.csv – review scores & comments

products.csv – product category info

sellers.csv – seller IDs & location

🔹 Methodology

Phase 1: SQL Exploration

Define churn & active customers.

Join customers, orders, payments, and reviews.

Build KPIs: Churn %, Avg. Order Value, Customer Lifetime Value (CLV), Retention by segment.

Phase 2: Python Analysis (EDA)

Data Cleaning & Preprocessing (nulls, duplicates, standardization).

Summary Statistics & Distribution Analysis.

Customer Segmentation (frequency, recency, monetary).

Feature Engineering for churn prediction.

Phase 3: Visualization (Tableau)

Interactive dashboard with filters for:

Customer demographics & geography

Churn vs Active customers

Revenue loss by churned customers

Segments by recency, frequency, spend

🔹 Key Insights (to be updated after analysis)

📌 Overall churn rate: TBD
📌 High-risk groups: TBD
📌 Behavioral signals: TBD
📌 Revenue impact: TBD

🔹 Recommendations (to be updated after analysis)

✅ Targeted campaigns for churn-prone customer segments.
✅ Incentives for repeat purchases (loyalty, discounts).
✅ Faster delivery improvements to boost satisfaction.
✅ Personalized retention campaigns for high LTV customers.

🔹 Deliverables

📓 Python EDA & Churn Analysis Notebook
 (to be added)

🗄️ SQL Queries
 (to be added)

📊 Tableau Dashboard (Interactive)
 (to be added)

📂 Data Samples
 (to be added)

🔹 Project Structure
customer-churn-olist/
│── README.md              <- Executive summary (this file)
│── data/                  <- Raw & cleaned CSVs (sample only)
│── sql/                   <- SQL queries
│── notebooks/             <- Jupyter notebooks (EDA, cleaning, analysis)
│── src/                   <- Python scripts (utils, preprocessing, modeling)
│── tableau/               <- Tableau workbook (.twb/.twbx)
│── reports/               <- Dashboards, visuals, and presentation exports

🔹 Dashboard Preview (to be added later)

(Insert Tableau screenshots using ![alt text](image.png) once ready)

🔹 About

An end-to-end churn analysis project using the Olist Brazil E-commerce dataset.
Combines SQL, Python, and Tableau to replicate a real-world Data Analyst workflow with direct business impact.
