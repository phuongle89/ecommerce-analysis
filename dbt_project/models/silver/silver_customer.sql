SELECT
    customer_id,
    first_name,
    last_name,
    CONCAT(first_name,' ',last_name) as full_name,
    try_cast(birth_date as date) as birth_date,

    CASE
        WHEN marital_status = 'M' THEN 'Married'
        WHEN marital_status = 'S' THEN 'Single'
        ELSE 'Unknown'
    END AS marital_status,

    CASE
        WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Unknown'
    END AS gender,

    email_address,
    try_cast(annual_income as float) as annual_income,
    education_level,
    occupation,
    home_owner

FROM {{ ref('bronze_customer')}}