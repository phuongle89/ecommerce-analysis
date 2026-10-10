WITH customer_month AS (
    SELECT DISTINCT
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS purchase_month
    FROM {{ref('fact_sales')}}
),


customer_cohort AS (
    SELECT
        customer_id,
        DATEFROMPARTS(YEAR(first_purchase_date), MONTH(first_purchase_date), 1) AS cohort_month
    FROM {{ref('rfm_features')}}
)


SELECT
    cm.customer_id,
    cc.cohort_month,
    cm.purchase_month
FROM customer_month cm
LEFT JOIN customer_cohort cc ON cm.customer_id = cc.customer_id
