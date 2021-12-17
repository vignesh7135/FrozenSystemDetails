{{
    config(
        materialized='table',
        store_failures = true
    )
}}
WITH SUPPLIERS AS (
    SELECT 
        Supplier_id ,
        Supplier_Name ,
        Supplier_Address ,
        Contact_NUmber ,
        Email_Address  
    FROM {{ source('FROZENSYSTEM', 'TBLSUPPLIER') }}
)

SELECT * FROM SUPPLIERS