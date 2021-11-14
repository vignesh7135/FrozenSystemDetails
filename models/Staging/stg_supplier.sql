WITH SUPPLIERS AS (
    SELECT 
        Supplier_id ,
        Supplier_Name ,
        Supplier_Address ,
        Contact_NUmber ,
        Email_Address  
    FROM "FROZENSYSTEMDB"."FROZENSYSTEM"."TBLSUPPLIER"
)

SELECT * FROM SUPPLIERS