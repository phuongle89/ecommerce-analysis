SELECT *
FROM {{ source('e_commerce', 'customer') }}