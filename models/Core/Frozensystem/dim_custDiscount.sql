WITH DISCOUNTS AS (
    SELECT 
        FIRST_NAME,
        LAST_NAME,
        CONTACT_NUMBER
    FROM {{ source('DBT_FROZENSYSTEM', 'dim_customer_details') }}
    WHERE PRICE>1000 

)
SELECT * FROM DISCOUNTS