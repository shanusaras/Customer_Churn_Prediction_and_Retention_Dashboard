# Olist E-commerce Data Dictionary

## 1. olist_customers_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| customer_id | string | Unique identifier for each customer |
| customer_unique_id | string | Anonymous identifier for each customer |
| customer_zip_code_prefix | string | First 5 digits of customer's ZIP code |
| customer_city | string | Customer's city name |
| customer_state | string | Customer's state (2-letter code) |

## 2. olist_geolocation_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| geolocation_zip_code_prefix | string | First 5 digits of ZIP code |
| geolocation_lat | float | Latitude coordinate |
| geolocation_lng | float | Longitude coordinate |
| geolocation_city | string | City name |
| geolocation_state | string | State (2-letter code) |

## 3. olist_orders_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| order_id | string | Unique order identifier |
| customer_id | string | Reference to customer |
| order_status | string | Order status (delivered, shipped, etc.) |
| order_purchase_timestamp | datetime | Purchase timestamp |
| order_approved_at | datetime | Payment approval timestamp |
| order_delivered_carrier_date | datetime | Order handed to carrier |
| order_delivered_customer_date | datetime | Actual delivery date |
| order_estimated_delivery_date | datetime | Estimated delivery date |

## 4. olist_order_items_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| order_id | string | Reference to order |
| order_item_id | int | Item sequence number |
| product_id | string | Reference to product |
| seller_id | string | Reference to seller |
| shipping_limit_date | datetime | Shipping limit date |
| price | float | Item price |
| freight_value | float | Item freight value |

## 5. olist_order_payments_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| order_id | string | Reference to order |
| payment_sequential | int | Payment sequence |
| payment_type | string | Payment method |
| payment_installments | int | Number of installments |
| payment_value | float | Payment value |

## 6. olist_order_reviews_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| review_id | string | Unique review identifier |
| order_id | string | Reference to order |
| review_score | int | Rating from 1-5 |
| review_comment_title | string | Review title |
| review_comment_message | string | Review message |
| review_creation_date | datetime | Review creation date |
| review_answer_timestamp | datetime | Review answer timestamp |

## 7. olist_products_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| product_id | string | Unique product identifier |
| product_category_name | string | Product category name |
| product_name_length | int | Name length |
| product_description_length | int | Description length |
| product_photos_qty | int | Number of product photos |
| product_weight_g | int | Product weight in grams |
| product_length_cm | int | Product length in cm |
| product_height_cm | int | Product height in cm |
| product_width_cm | int | Product width in cm |

## 8. olist_sellers_dataset
| Column | Data Type | Description |
|--------|-----------|-------------|
| seller_id | string | Unique seller identifier |
| seller_zip_code_prefix | string | First 5 digits of seller's ZIP code |
| seller_city | string | Seller's city name |
| seller_state | string | Seller's state (2-letter code) |

## 9. product_category_name_translation
| Column | Data Type | Description |
|--------|-----------|-------------|
| product_category_name | string | Category name in Portuguese |
| product_category_name_english | string | Category name in English |

## Key Relationships
- `olist_orders.customer_id` → `olist_customers.customer_id`
- `olist_order_items.order_id` → `olist_orders.order_id`
- `olist_order_items.product_id` → `olist_products.product_id`
- `olist_order_items.seller_id` → `olist_sellers.seller_id`
- `olist_order_payments.order_id` → `olist_orders.order_id`
- `olist_order_reviews.order_id` → `olist_orders.order_id`
