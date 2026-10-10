SELECT *
FROM {{ source('e_commerce', 'product') }}