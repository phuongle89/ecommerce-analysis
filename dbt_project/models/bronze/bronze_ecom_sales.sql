SELECT *
FROM {{ source('e_commerce', 'ecom_sales') }}