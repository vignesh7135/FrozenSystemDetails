WITH PAYMENTS AS (
    SELECT
        Payment_id ,
        Order_Number,
        Customer_id ,
        Date_order ,
        Claim_Date 
        Payment_Method,
        Quantity,
        Price
    FROM "FROZENSYSTEMDB"."FROZENSYSTEM"."TBLPAYMENTS"
)

SELECT * FROM PAYMENTS