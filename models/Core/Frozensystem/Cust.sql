{{
    config(
        materialized='table',
        store_failures = true
    )
}}
WITH CBE_CUSTUMER AS(
    SELECT 
        A.FIRST_NAME,
        A.LAST_NAME,
        A.ADDRESS,
        {{ drop_id_field ('B.PRODUCTS_ID') }} AS PRODUCTS_ID,
        C.ORDER_ID
    FROM {{ source('FROZENSYSTEM', 'TBLCUSTOMERS') }} AS A
    LEFT JOIN {{ source('FROZENSYSTEM', 'TBLTRANSACTIONS') }} AS B ON A.CUSTOMER_ID = B.CUSTOMER_ID
    LEFT JOIN {{ ref('dim_customer_details') }} AS C ON A.FIRST_NAME = C.FIRST_NAME
    WHERE A.ADDRESS = 'COIMBATORE'
    ORDER BY 1
)

SELECT * FROM CBE_CUSTUMER;