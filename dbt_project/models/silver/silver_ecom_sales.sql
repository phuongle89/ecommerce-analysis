SELECT
    row_id,
    order_id,
    try_cast(order_date as date) as order_date,
    customer_id,
    segment,

    CASE
        WHEN region_code LIKE 'RRR%'
             AND LEN(region_code) = 7
        THEN CONCAT(
            'R',
            SUBSTRING(region_code, 4, 4)
        )
        ELSE region_code
    END AS region_id,

    CASE
        WHEN product_code LIKE 'PPP%'
             AND LEN(product_code) = 9
        THEN CONCAT(
            'P',
            SUBSTRING(product_code, 4, 6)
        )
        ELSE product_code
    END AS product_id,

    try_cast(quantity as integer) as quantity,
    try_cast(sales as float) as revenue,
    try_cast(discount as float) as discount,
    try_cast(profit as float) as profit

FROM {{ ref('bronze_ecom_sales')}}
