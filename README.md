# Customer Churn Analysis (SQL + Power BI)

## 1. Project Overview
This project analyzes customer churn behavior using the Telco customer dataset. The goal is to identify key drivers of churn and provide actionable business recommendations to improve customer retention.

The analysis focuses on customer segmentation across contract type, tenure, and monthly charges to understand patterns behind customer attrition.

---

## 2. Dataset
- Source: Telco Customer Churn Dataset (IBM sample dataset)
- Records: ~7,000 customers
- Key features:
  - Customer demographics
  - Contract type
  - Tenure
  - Monthly charges
  - Churn status

---

## 3. Tools Used
- SQL (Data analysis & aggregation)
- Power BI (Data visualization)

---

## 4. Business Questions
1. What is the overall churn rate?
2. Which contract types have the highest churn?
3. How does tenure affect churn behavior?
4. Do higher monthly charges increase churn?
5. What combinations of factors lead to highest churn risk?

---

# 5. Key Insights

## 5.1 Overall Churn Rate
- Total churn rate: ~27%
- More than 1 in 4 customers are leaving the service.

---

## 5.2 Churn by Contract Type
- Month-to-month: 43%
- One-year: 11%
- Two-year: 3%

### Insight:
Customers without long-term contracts are significantly more likely to churn. Month-to-month customers show the highest churn rate.

### Interpretation:
Lack of contractual commitment is a major driver of customer attrition.

---

## 5.3 Churn by Tenure
- 0–12 months: 48%
- 12–24 months: 30%
- 24+ months: 14%

### Insight:
Churn is heavily concentrated in the early lifecycle stage.

### Interpretation:
The first year of customer engagement is the most critical period for retention.

---

## 5.4 Churn by Monthly Charges
- Low (≤50): 16%
- Medium (51–80): 29%
- High (>80): 34%

### Insight:
Higher monthly charges are associated with higher churn rates.

### Interpretation:
Price sensitivity plays a significant role in customer retention.

---

## 5.5 Combined Analysis (Contract + Tenure + Charges)
- Month-to-month customers in early tenure show churn rates up to ~52%
- One-year and two-year contracts consistently show lower churn

### Insight:
Contract type amplifies churn risk, especially during early tenure and high charges.

---

# 6. Business Recommendations

## 6.1 Improve Early Customer Retention
- Focus on onboarding experience in first 12 months
- Introduce early engagement programs

## 6.2 Encourage Long-Term Contracts
- Offer discounts for annual and 2-year plans
- Promote contract upgrades

## 6.3 Address Pricing Sensitivity
- Introduce value-added bundles for high-price plans
- Offer loyalty incentives

## 6.4 Target High-Risk Segments
- Month-to-month + high charges + early tenure customers
- Apply proactive retention strategies

---

# 7. Conclusion
Customer churn is primarily driven by:
- Contract type (strongest factor)
- Early tenure stage
- High monthly charges

Focusing on early-stage retention and long-term contracts can significantly reduce churn.

---

# 8. Dashboard
A Power BI dashboard was built to visualize:
- Churn by contract type
- Churn by tenure group
- Churn by monthly charges
- High-risk customer segments
