{{
    config(
        materialized='table',
        store_failures = true,
        tags=["customer_data"]
    )
}}
WITH TRANSACTIONS AS (
    SELECT 
        Emp_id ,
        Customer_id ,
        Order_id ,
        Products_id ,
        Payment_id 
    FROM {{ source('FROZENSYSTEM', 'TBLTRANSACTIONS') }}
)

SELECT * FROM TRANSACTIONS