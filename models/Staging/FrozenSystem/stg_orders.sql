WITH ORDERS AS (
    SELECT 
         id ,
         Payment_Id ,
         Customer_Id ,
         Date_Order ,
         quantity ,
         Price
    FROM {{ source('FROZENSYSTEM', 'TBLORDER') }}
)
SELECT * FROM ORDERS

