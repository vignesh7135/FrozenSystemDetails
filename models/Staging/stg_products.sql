WITH PRODUCTS AS (
    SELECT 
        products_Id, 
        product_Name ,
        product_Type ,
        image text ,
        description text ,
        price ,
        On_hand ,
        quantity
    FROM "FROZENSYSTEMDB"."FROZENSYSTEM"."TBLPRODUCTS"
)

SELECT * FROM PRODUCTS