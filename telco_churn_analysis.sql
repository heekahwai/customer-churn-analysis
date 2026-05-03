/* =========================================
   CUSTOMER CHURN ANALYSIS - TELCO DATASET
   ========================================= */


/* 1. Total Customers */
SELECT COUNT(*) AS total_customers
FROM telco_customer_churn;



/* 2. Overall Churn Rate */
SELECT 
    Churn,
    COUNT(*) AS total_customers,
    COUNT(*) * 1.0 / (SELECT COUNT(*) FROM telco_customer_churn) AS churn_rate
FROM telco_customer_churn
GROUP BY Churn;



/* 3. Churn Rate by Contract Type */
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS churn_rate
FROM telco_customer_churn
GROUP BY Contract;



/* 4. Churn Rate by Tenure Bucket */
SELECT 
    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_bucket,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS churn_rate

FROM telco_customer_churn
GROUP BY 
    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END;



/* 5. Churn Rate by Monthly Charges Group */
SELECT 
    CASE
        WHEN MonthlyCharges <= 50 THEN 'Low (<=50)'
        WHEN MonthlyCharges <= 80 THEN 'Medium (51-80)'
        ELSE 'High (>80)'
    END AS charge_group,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS churn_rate

FROM telco_customer_churn
GROUP BY 
    CASE
        WHEN MonthlyCharges <= 50 THEN 'Low (<=50)'
        WHEN MonthlyCharges <= 80 THEN 'Medium (51-80)'
        ELSE 'High (>80)'
    END;



/* 6. Churn by Contract and Tenure */
SELECT 
    Contract,

    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_bucket,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS churn_rate

FROM telco_customer_churn
GROUP BY 
    Contract,
    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END;



/* 7. Churn by Contract, Tenure, and Charges */
SELECT 
    Contract,

    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_bucket,

    CASE
        WHEN MonthlyCharges <= 50 THEN 'Low (<=50)'
        WHEN MonthlyCharges <= 80 THEN 'Medium (51-80)'
        ELSE 'High (>80)'
    END AS charge_group,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS churn_rate

FROM telco_customer_churn
GROUP BY 
    Contract,
    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END,
    CASE
        WHEN MonthlyCharges <= 50 THEN 'Low (<=50)'
        WHEN MonthlyCharges <= 80 THEN 'Medium (51-80)'
        ELSE 'High (>80)'
    END;