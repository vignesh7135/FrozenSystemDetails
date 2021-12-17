{{
    config(
        materialized='table',
        store_failures = true
    )
}}
WITH PRODUCTS AS (
    SELECT 
        products_Id, 
        product_Name ,
        product_Type ,
        image  ,
        description  ,
        price ,
        On_hand ,
        quantity
    FROM {{ source('FROZENSYSTEM', 'TBLPRODUCTS') }}
)

SELECT * FROM PRODUCTS