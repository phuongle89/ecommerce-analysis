WITH order_product AS (
    SELECT DISTINCT
        order_id,
        product_id
    FROM {{ ref('fact_sales') }}
),
product_pairs AS (
    SELECT
        a.order_id,
        a.product_id AS product_a,
        b.product_id AS product_b
    FROM order_product a
    INNER JOIN order_product b
        ON a.order_id = b.order_id
        AND a.product_id < b.product_id
),
pair_orders AS (
    SELECT
        product_a,
        product_b,
        COUNT(DISTINCT order_id) AS orders
    FROM product_pairs
    GROUP BY
        product_a,
        product_b
),
product_info AS (
    SELECT
        product_id,
        product_name
    FROM {{ ref('dim_product') }}
)
SELECT TOP 10
    p.product_a,
    pa.product_name AS product_a_name,
    p.product_b,
    pb.product_name AS product_b_name,
    p.orders
FROM pair_orders p
LEFT JOIN product_info pa
    ON p.product_a = pa.product_id
LEFT JOIN product_info pb
    ON p.product_b = pb.product_id
ORDER BY p.orders DESC
