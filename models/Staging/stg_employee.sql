WITH EMPLOYEE AS (
    SELECT 
        Employee_id ,
        First_name,
        Middle_Name ,
        Last_Name ,
        Age,
        Address ,
        Contact_Number ,
        Email_Address 
    FROM "FROZENSYSTEMDB"."FROZENSYSTEM"."TBLEMPLOYEE"
)
SELECT * FROM employee