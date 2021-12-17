{{
    config(
        materialized='table',
        store_failures = true,
        tags=["customer_data"]
    )
}}
with Customers as (
    SELECT
        Customer_id AS CUST_ID,
        first_name ,
        last_name ,
        City_address ,
        Address ,
        Age ,
        Phone_number ,
        Zipcode 
    FROM {{ source('FROZENSYSTEM', 'TBLCUSTOMERS') }}
)

SELECT * FROM Customers