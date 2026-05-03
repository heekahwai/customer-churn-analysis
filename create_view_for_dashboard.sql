/* =========================================
   CUSTOMER CHURN ANALYSIS - CREATE VIEWS
   ========================================= */


/* 1. Summary */

CREATE VIEW vw_churn_summary AS

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churn_count,
    SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END) * 1.0 / (SELECT COUNT(*) FROM telco_customer_churn) * 100 AS churn_rate,
    AVG(MonthlyCharges) AS average_monthly_charge
FROM telco_customer_churn;


/* 2. Churn Rate by Contract Type */
CREATE VIEW vw_churn_rate_by_contract AS

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100 AS churn_rate
FROM telco_customer_churn
GROUP BY Contract;



/* 3. Churn Rate by Tenure Bucket */
CREATE VIEW vw_churn_rate_by_tenure_bucket AS

SELECT 
    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_bucket,

    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100 AS churn_rate
FROM telco_customer_churn
GROUP BY 
    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END;



/* 4. Churn Rate by Monthly Charges Group */
CREATE VIEW vw_churn_rate_by_monthly_charge_group AS

SELECT 
    CASE
        WHEN MonthlyCharges <= 50 THEN 'Low (<=50)'
        WHEN MonthlyCharges <= 80 THEN 'Medium (51-80)'
        ELSE 'High (>80)'
    END AS charge_group,

    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100 AS churn_rate
FROM telco_customer_churn
GROUP BY 
    CASE
        WHEN MonthlyCharges <= 50 THEN 'Low (<=50)'
        WHEN MonthlyCharges <= 80 THEN 'Medium (51-80)'
        ELSE 'High (>80)'
    END;



/* 5. Churn by Contract and Tenure */
CREATE VIEW vw_churn_rate_by_contract_and_tenure AS

SELECT 
    Contract,

    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_bucket,

    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100 AS churn_rate
FROM telco_customer_churn
GROUP BY 
    Contract,
    CASE 
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure < 24 THEN '12-24 months'
        ELSE '24+ months'
    END;



/* 6. Churn by Contract, Tenure, and Charges */
CREATE VIEW vw_churn_rate_by_contract_tenure_and_charge AS

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
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100 AS churn_rate
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