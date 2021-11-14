WITH TRANSACTIONS AS (
    SELECT 
        Employee_id ,
        Customer_id ,
        Order_id ,
        Products_id ,
        Payment_id 
    FROM "FROZENSYSTEMDB"."FROZENSYSTEM"."TBLTRANSACTIONS"
)

SELECT * FROM TRANSACTIONS