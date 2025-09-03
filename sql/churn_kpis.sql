-- churn_kpis.sql
-- SQL queries to calculate churn KPIs for the Olist e-commerce dataset

-- 1. Basic Churn Rate Calculation
WITH customer_activity AS (
    SELECT 
        customer_id,
        MAX(order_purchase_timestamp) as last_purchase_date,
        COUNT(DISTINCT order_id) as total_orders,
        SUM(payment_value) as total_spent
    FROM olist_orders o
    JOIN olist_order_payments p ON o.order_id = p.order_id
    WHERE order_status = 'delivered'
    GROUP BY customer_id
),
churn_status AS (
    SELECT 
        customer_id,
        last_purchase_date,
        total_orders,
        total_spent,
        CASE 
            WHEN DATE_DIFF(CURRENT_DATE(), last_purchase_date, DAY) > 90 THEN 'churned'
            ELSE 'active'
        END as churn_status
    FROM customer_activity
)
SELECT 
    churn_status,
    COUNT(*) as customer_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM churn_status
GROUP BY churn_status;

-- 2. Churn Rate by Customer Segment
WITH customer_segments AS (
    -- Add your customer segmentation logic here
    -- This is a placeholder for the actual segmentation query
    SELECT 
        c.customer_id,
        CASE 
            WHEN COUNT(DISTINCT o.order_id) > 5 THEN 'high_value'
            WHEN COUNT(DISTINCT o.order_id) > 2 THEN 'medium_value'
            ELSE 'low_value'
        END as customer_segment,
        MAX(o.order_purchase_timestamp) as last_purchase_date
    FROM olist_customers c
    LEFT JOIN olist_orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
),
churn_status AS (
    SELECT 
        customer_id,
        customer_segment,
        CASE 
            WHEN DATE_DIFF(CURRENT_DATE(), last_purchase_date, DAY) > 90 THEN 'churned'
            ELSE 'active'
        END as churn_status
    FROM customer_segments
)
SELECT 
    customer_segment,
    churn_status,
    COUNT(*) as customer_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY customer_segment), 2) as percentage
FROM churn_status
GROUP BY customer_segment, churn_status
ORDER BY customer_segment, churn_status;
