# Churn Definition and Assumptions

## Churn Criteria

### Primary Definition
A customer is considered **churned** if they meet **all** of the following criteria:
1. **Inactivity Period**: No purchases for **90 days** from their last order date
2. **Active History**: Made at least **one purchase** before the observation period
3. **Observation Period**: Last 12 months of available data

### Formula
```
Churn Status = 
  IF (
    (CURRENT_DATE - Last_Purchase_Date > 90 days) 
    AND 
    (First_Purchase_Date < Last_Purchase_Date)
  ) 
  THEN "Churned" 
  ELSE "Active"
```

## Key Assumptions

### 1. Business Context
- **Industry Standard**: 90-day inactivity period aligns with e-commerce industry standards
- **Purchase Cycle**: Accounts for typical repurchase cycles in Brazilian e-commerce
- **Seasonality**: Accounts for occasional buyers who may not make frequent purchases

### 2. Data Considerations
- **First-time Buyers**: Customers with only one purchase are not immediately considered churned
- **Recent Customers**: New customers have a 90-day grace period before being evaluated for churn
- **Order Status**: Only orders with status = 'delivered' are considered valid purchases

### 3. Technical Implementation
- **Date Handling**: All dates are in UTC
- **Data Freshness**: Analysis is based on the most recent data available
- **Missing Data**: Orders with missing delivery dates are excluded from churn calculation

## Churn Calculation Example

| Customer ID | First Purchase | Last Purchase | Days Since Last Purchase | Churn Status |
|-------------|----------------|----------------|--------------------------|--------------|
| C1          | 2023-01-01     | 2023-06-01     | 95                      | Churned      |
| C2          | 2023-02-15     | 2023-07-20     | 45                      | Active       |
| C3          | 2023-07-01     | 2023-07-01     | 35                      | Active (New) |

## Potential Limitations
1. **Customer Returns**: Doesn't account for customers who return items but remain engaged
2. **Multiple Accounts**: Customers with multiple accounts may be miscategorized
3. **Product Categories**: Doesn't differentiate churn by product category
4. **Customer Lifetime Value**: Doesn't weight churn by customer value

## Future Enhancements
1. Implement a tiered churn definition based on customer value
2. Add seasonal adjustments for holiday shopping periods
3. Incorporate customer engagement metrics (website visits, cart additions)
