# Data Directory Documentation

This directory contains all data files used in the Olist E-commerce Churn Analysis project.

## Directory Structure

```
data/
├── raw/                   # Original, immutable data dump
├── processed/            # Cleaned and transformed data
├── output/               # Analysis outputs and generated files
│   └── samples/          # Sample data files for documentation
└── README.md             # This file
```

## File Descriptions

### Raw Data (`/raw`)
Contains the original, unaltered data files. These should never be modified.
- `olist_customers_dataset.csv`
- `olist_orders_dataset.csv`
- `olist_order_items_dataset.csv`
- `olist_order_payments_dataset.csv`
- `olist_order_reviews_dataset.csv`
- `olist_products_dataset.csv`
- `olist_sellers_dataset.csv`
- `product_category_name_translation.csv`

### Processed Data (`/processed`)
Contains cleaned and transformed data ready for analysis.
- `cleaned_orders.parquet`
- `customer_features.parquet`
- `churn_labels.parquet`

### Output Data (`/output`)
Contains analysis outputs and generated files.
- `churn_predictions.csv`
- `rfm_scores.parquet`
- `customer_segments.parquet`

### Sample Data (`/output/samples`)
Contains sample JSON files for documentation and testing.
- `sample_olist_*.json` - Sample records from each dataset

## Data Dictionary

For detailed column descriptions and data types, see:
[Data Dictionary](../docs/data_dictionary.md)

## Update Log

- 2025-09-04: Initial data directory structure created
- 2025-09-04: Moved sample JSON files to /output/samples/
