# Customer Churn Prediction & Retention Dashboard  

## 🔹 Business Problem  
Every month, e-commerce platforms silently lose paying customers. Research shows that **retaining just 5% more users can increase revenue by 20–30%**.  

The challenge: Identify which customers are most at risk of churning, understand *why*, and design **targeted retention strategies** that save revenue.  

---

## 🔹 Objectives  
- Analyze customer lifecycle, purchase frequency, and satisfaction patterns.  
- Predict customer churn risk using **ML classification models**.  
- Segment at-risk users into actionable groups (e.g., high-value vs low-value churners).  
- Design **retention campaigns** (discounts, loyalty points, push notifications).  
- Simulate **projected revenue saved** if interventions succeed.  
- Deliver insights through an **interactive Tableau dashboard** for decision-makers.  

---

## 🔹 Dataset  
**Source**: [Olist Brazilian E-commerce Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
**Size**: ~100k orders across multiple relational tables  

**Key tables used**:  
- `customers.csv` → Customer profiles & location  
- `orders.csv` → Order lifecycle & status  
- `order_items.csv` → Products purchased  
- `payments.csv` → Payment methods & amounts  
- `reviews.csv` → Customer satisfaction  
- `sellers.csv` → Seller performance  

---

## 🔹 Methodology  

### Phase 1: SQL Exploration  
- Joined relational tables (customers, orders, items, payments, reviews).  
- Built churn-related KPIs:  
  - Inactivity (no orders in last 6 months)  
  - Late deliveries & cancellations  
  - Poor review scores  
- Aggregated churn by geography, category, and payment method.  

### Phase 2: Python Analysis & Modeling  
- Data Cleaning & Preprocessing (null handling, encoding, feature engineering).  
- EDA: Customer lifecycle, frequency, satisfaction, purchase recency.  
- Built ML churn model (Logistic Regression, Random Forest).  
- Segmented customers by churn risk: High, Medium, Low.  
- Calculated **projected revenue loss** from churned high-value customers.  

### Phase 3: Visualization (Tableau)  
- Interactive dashboard with:  
  - **Churn Rate % by lifecycle stage & geography**  
  - **At-risk customer segments**  
  - **Revenue at risk (top 10% churners)**  
  - **Retention campaign impact simulation**  
- Drilldowns for marketing & product teams.  

### Phase 4 (Optional): Automation  
- Automated **weekly churn risk report** for business stakeholders using Python scripts.  

---

## 🔹 Key Insights *(to be updated after analysis)*  
📌 Overall churn rate: XX%  
📌 High-risk group: [Segment to be identified]  
📌 Churn drivers: [Top 3 factors from model/EDA]  
📌 Revenue at risk: $XXXk if no action taken  

---

## 🔹 Recommendations *(to be updated after insights)*  
✅ Targeted retention campaigns for top 10% at-risk customers.  
✅ Loyalty program to reduce churn in high-value segment.  
✅ Personalized communication for inactive users.  
✅ Incentivize higher purchase frequency (cashbacks, bonus points).  

---

## 🔹 Deliverables  
✔️ Python Notebook (EDA + ML churn model)  
✔️ SQL Queries (churn KPIs & features)  
✔️ Tableau Dashboard (interactive insights)  
✔️ Optional Automation Script (weekly churn report)  

---

## 🔹 Project Structure  

```text
customer-churn-prediction-dashboard/
│
├── README.md               <- Executive summary (this file)
│
├── data/                   
│   ├── raw/                <- Original Olist e-commerce dataset (sample only)
│   └── processed/          <- Cleaned & feature-engineered data for analysis
│
├── sql/                    
│   ├── churn_kpis.sql      <- SQL queries to calculate churn KPIs
│   └── feature_eng.sql     <- SQL for feature extraction & joins
│
├── notebooks/              
│   ├── 01_sql_exploration.ipynb   <- SQL data exploration
│   ├── 02_data_cleaning.ipynb     <- Data preprocessing
│   ├── 03_eda.ipynb               <- Exploratory data analysis
│   └── 04_churn_model.ipynb       <- Churn modeling & predictions
│
├── src/                    
│   ├── preprocessing.py    <- Data cleaning & transformation functions
│   ├── utils.py            <- Helper utilities
│   └── report_automation.py<- Script for automated churn report
│
├── tableau/                
│   └── churn_dashboard.twbx <- Interactive Tableau dashboard
│
├── reports/                
│   ├── churn_insights.pdf   <- Insight report for stakeholders
│   ├── dashboard_screens/   <- Tableau dashboard screenshots
│   └── presentation.pptx    <- Executive presentation slides
│
└── requirements.txt         <- Python dependencies
```

---

## 🔹 Dashboard Preview  
*(<Tableau visuals>)*  

---

## 🔹 About  
An **end-to-end Customer Churn Prediction & Retention project** combining SQL, Python, and Tableau.  

This project highlights:  
- **Data Analyst skills** (SQL, dashboards, KPIs)  
- **Predictive analytics mindset** (ML model for churn)  
- **Business storytelling** (showing revenue at risk & retention impact)  

Designed to showcase a **real-world data analytics workflow** with **direct $$$ impact** for e-commerce businesses.  

