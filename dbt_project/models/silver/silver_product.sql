SELECT
    product_code as product_id,
    product as product_name,
    category,
    subcategory
FROM {{ ref('bronze_product') }}