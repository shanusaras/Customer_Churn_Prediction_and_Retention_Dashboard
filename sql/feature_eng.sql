-- feature_eng.sql
-- SQL queries for feature extraction and joins for the Olist e-commerce dataset

-- 1. Customer Features
WITH customer_features AS (
    SELECT 
        c.customer_id,
        c.customer_state,
        c.customer_city,
        -- RFM Features
        COUNT(DISTINCT o.order_id) as total_orders,
        SUM(COALESCE(p.payment_value, 0)) as total_spent,
        AVG(COALESCE(p.payment_value, 0)) as avg_order_value,
        MAX(o.order_purchase_timestamp) as last_purchase_date,
        MIN(o.order_purchase_timestamp) as first_purchase_date,
        -- Recency (days since last purchase)
        DATE_DIFF(CURRENT_DATE(), MAX(o.order_purchase_timestamp), DAY) as days_since_last_purchase,
        -- Frequency (orders per month)
        COUNT(DISTINCT o.order_id) / 
            NULLIF(DATE_DIFF(MAX(o.order_purchase_timestamp), MIN(o.order_purchase_timestamp), MONTH), 0) as orders_per_month,
        -- Payment method diversity
        COUNT(DISTINCT p.payment_type) as payment_methods_used,
        -- Review scores
        AVG(r.review_score) as avg_review_score,
        -- Delivery performance
        AVG(DATE_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY)) as avg_delivery_time_days,
        -- Cancellation rate
        SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) * 1.0 / 
            COUNT(DISTINCT o.order_id) as cancellation_rate
    FROM olist_customers c
    LEFT JOIN olist_orders o ON c.customer_id = o.customer_id
    LEFT JOIN olist_order_payments p ON o.order_id = p.order_id
    LEFT JOIN olist_order_reviews r ON o.order_id = r.order_id
    GROUP BY c.customer_id, c.customer_state, c.customer_city
),
-- 2. Product Preferences
product_preferences AS (
    SELECT 
        oi.customer_id,
        -- Most purchased category
        FIRST_VALUE(p.product_category_name) OVER (
            PARTITION BY oi.customer_id 
            ORDER BY COUNT(*) DESC
        ) as favorite_category,
        -- Number of unique categories purchased
        COUNT(DISTINCT p.product_category_name) as unique_categories_purchased
    FROM olist_order_items oi
    JOIN olist_products p ON oi.product_id = p.product_id
    GROUP BY oi.customer_id, p.product_category_name
)
-- Final feature set
SELECT 
    cf.*,
    pp.favorite_category,
    pp.unique_categories_purchased,
    -- Churn target variable (90 days of inactivity)
    CASE 
        WHEN cf.days_since_last_purchase > 90 THEN 1 
        ELSE 0 
    END as is_churned
FROM customer_features cf
LEFT JOIN (
    SELECT 
        customer_id,
        MAX(favorite_category) as favorite_category,
        MAX(unique_categories_purchased) as unique_categories_purchased
    FROM product_preferences
    GROUP BY customer_id
) pp ON cf.customer_id = pp.customer_id;
