# Customer Churn Prediction & Retention Dashboard  

## 🔹 Business Problem  
Every month, e-commerce platforms silently lose paying customers. Research shows that **retaining just 5% more users can increase revenue by 20–30%**.  

The challenge: Identify which customers are most at risk of churning, understand **why**
, and design **targeted retention strategies** that save revenue.  

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
**Source**: Olist Brazilian E-commerce Dataset  
**Size**: ~100k orders from 2016-2018 across multiple Brazilian marketplaces  

### About the Data
This real-world dataset from Olist, Brazil's largest department store in marketplaces, provides a comprehensive view of e-commerce orders. The data has been anonymized and includes:
- Order details and status tracking
- Customer purchase history and satisfaction ratings
- Seller performance metrics
- Product categories and pricing
- Geographic distribution of customers and sellers

### Key Features
- **Real commercial data** from 2016-2018
- Multiple marketplaces across Brazil
- Complete order lifecycle tracking
- Customer satisfaction metrics
- Geographic data for location-based analysis

### Sample Data Files
Sample JSON files are provided in `data/output/samples/` for development and testing purposes. These files:
- Contain representative subsets of the original CSV data
- Maintain the same structure as the full dataset
- Are useful for:
  - Development and testing of analysis code
  - Documentation and examples
  - API testing and development
  - Version control (smaller than full CSVs)

File naming convention: `sample_<original_filename>.json`

*Note: All identifying business information has been anonymized for privacy*

**Key tables used**:  
- `olist_customers_dataset.csv` → Customer profiles & location  
- `olist_orders_dataset.csv` → Order lifecycle & status  
- `olist_order_items_dataset.csv` → Products purchased in each order  
- `olist_order_payments_dataset.csv` → Payment methods & amounts  
- `olist_order_reviews_dataset.csv` → Customer satisfaction & feedback  
- `olist_sellers_dataset.csv` → Seller information  
- `olist_products_dataset.csv` → Product details & categories  
- `olist_geolocation_dataset.csv` → Geographic coordinates by ZIP code  
- `product_category_name_translation.csv` → Product category names in English  

*Note: All tables follow the original Olist dataset structure*

---

## 🔹 Methodology  

### ✅ Phase 1: Data Loading & Initial Setup (Completed)  
- **Data Documentation**:  
  - Created comprehensive data dictionary for all key tables  
  - Developed Entity Relationship Diagram (ERD) showing table relationships  
  - Documented data types, primary/foreign keys, and relationships  
- **Churn Definition**:  
  - Established 90-day inactivity period as churn threshold  
  - Documented assumptions and business rules  
  - Created churn calculation methodology  
- **Project Setup**:  
  - Organized repository structure  
  - Set up Jupyter notebooks for analysis  
  - Documented initial data quality observations  

### 🔄 Phase 2: Data Cleaning & Feature Engineering (In Progress)  
- **Data Cleaning**:  
  - Handle missing values and outliers  
  - Standardize data formats and types  
  - Address data quality issues  
- **Feature Engineering**:  
  - RFM (Recency, Frequency, Monetary) metrics  
  - Behavioral patterns from order history  
  - Customer engagement metrics  
- **SQL Implementation**:  
  - Write optimized queries for feature extraction  
  - Create materialized views for performance  

### 📊 Phase 3: Exploratory Data Analysis & Modeling  
- **Exploratory Analysis**:  
  - Customer segmentation analysis  
  - Churn rate by customer segments  
  - Identification of churn indicators  
- **Predictive Modeling**:  
  - Build and evaluate churn prediction models  
  - Feature importance analysis  
  - Model interpretation and validation  

### 📈 Phase 4: Dashboard Development  
- **Interactive Visualizations**:  
  - Churn rate trends and patterns  
  - Customer segment analysis  
  - Revenue impact of churn  
- **Executive Summary View**:  
  - Key performance indicators  
  - At-risk customer segments  
  - Recommended actions  

### 🤖 Phase 5: Automation & Reporting (Optional)  
- **Automated Reports**:  
  - Weekly churn risk reports  
  - Performance dashboards  
  - Alert system for high-risk customers  
- **API Endpoints**:  
  - Real-time churn prediction  
  - Customer health scores  

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


