# Olist E-commerce Data Model

## Visual ERD Reference

### Option 1: dbdiagram.io
We've created an interactive ERD using dbdiagram.io for better visualization:

```
Table customers {
  customer_id varchar [primary key]
  customer_unique_id varchar
  customer_zip_code_prefix varchar
  customer_city varchar
  customer_state varchar
}

Table orders {
  order_id varchar [primary key]
  customer_id varchar [ref: > customers.customer_id]
  order_status varchar
  order_purchase_timestamp timestamp
  order_approved_at timestamp
  order_delivered_carrier_date timestamp
  order_delivered_customer_date timestamp
  order_estimated_delivery_date timestamp
}

# ... (other table definitions)
```

### Option 2: Mermaid.js (GitHub Compatible)
```mermaid

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--|{ ORDER_ITEMS : contains
    ORDERS ||--|{ ORDER_PAYMENTS : has
    ORDERS ||--|| ORDER_REVIEWS : receives
    SELLERS ||--o{ ORDER_ITEMS : sells
    PRODUCTS ||--o{ ORDER_ITEMS : appears_in
    CUSTOMERS }|--|| GEOLOCATION : lives_in
    SELLERS }|--|| GEOLOCATION : located_in
    PRODUCTS }|--|| CATEGORY_TRANSLATION : has_category

    CUSTOMERS {
        string customer_id PK
        string customer_unique_id
        string customer_zip_code_prefix
        string customer_city
        string customer_state
    }
    
    ORDERS {
        string order_id PK
        string customer_id FK
        string order_status
        datetime order_purchase_timestamp
        datetime order_approved_at
        datetime order_delivered_carrier_date
        datetime order_delivered_customer_date
        datetime order_estimated_delivery_date
    }
    
    ORDER_ITEMS {
        string order_id FK
        int order_item_id
        string product_id FK
        string seller_id FK
        datetime shipping_limit_date
        float price
        float freight_value
    }
    
    ORDER_PAYMENTS {
        string order_id FK
        int payment_sequential
        string payment_type
        int payment_installments
        float payment_value
    }
    
    ORDER_REVIEWS {
        string review_id PK
        string order_id FK
        int review_score
        string review_comment_title
        string review_comment_message
        datetime review_creation_date
        datetime review_answer_timestamp
    }
    
    PRODUCTS {
        string product_id PK
        string product_category_name
        int product_name_lenght
        int product_description_lenght
        int product_photos_qty
        int product_weight_g
        int product_length_cm
        int product_height_cm
        int product_width_cm
    }
    
    SELLERS {
        string seller_id PK
        string seller_zip_code_prefix
        string seller_city
        string seller_state
    }
    
    GEOLOCATION {
        string zip_code_prefix
        float geolocation_lat
        float geolocation_lng
        string geolocation_city
        string geolocation_state
    }
    
    CATEGORY_TRANSLATION {
        string product_category_name PK
        string product_category_name_english
    }
```

## How to Use This ERD

### Viewing Options
1. **GitHub**: The Mermaid diagram renders automatically in GitHub's markdown viewer
2. **Interactive Editor**: 
   - Copy the Mermaid code
   - Paste into [Mermaid Live Editor](https://mermaid.live/)
   - Export as PNG/SVG/PDF
3. **Kaggle Reference**: 
   - Original schema: [Olist Dataset Schema on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
   - Includes additional context and field descriptions

### ERD Best Practices
- Use dbdiagram.io for interactive editing and collaboration
- Use Mermaid for version-controlled documentation
- Include both entity relationships and attribute details
- Document cardinality and optionality clearly

## Key Relationships

1. **Customers** can place multiple **Orders** (1:N)
2. Each **Order** contains multiple **Order Items** (1:N)
3. Each **Order** can have multiple **Payments** (1:N)
4. Each **Order** receives one **Review** (1:1)
5. **Sellers** can sell multiple **Order Items** (1:N)
6. **Products** can appear in multiple **Order Items** (1:N)
7. **Customers** and **Sellers** are linked to **Geolocation** via ZIP code prefix
8. **Products** are linked to **Category Translation** for English category names
