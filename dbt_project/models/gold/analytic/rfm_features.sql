WITH customer_sales AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_purchase_date,
        MIN(order_date) AS first_purchase_date,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(revenue) AS monetary
    FROM {{ref('fact_sales')}}
    GROUP BY customer_id
)
SELECT
    customer_id,
    first_purchase_date,
    last_purchase_date,
    DATEDIFF(
        DAY,
        last_purchase_date,
        (SELECT MAX(order_date) FROM {{ref('fact_sales')}})
    ) AS recency,
    frequency,
    monetary
FROM customer_sales
