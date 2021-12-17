WITH CUSTOMER_DETAILS AS (
    SELECT  A.Employee_id,
            A.First_name,
            A.middle_name, 
            A.last_name,
            A.contact_number,
            D.Feed_status,
            B.customer_id,
            SPLIT_PART(B.order_id, '_', 3) AS ORDER_ID,
            CAST(C.date_order AS DATE) AS date_order,
            C.quantity,
            C.price,
            CONCAT(D.FIRST_NAME, ' ', D.LAST_NAME) AS CUST_NAME, 
            D.phone_number AS Emp_number,
            b.Products_id,
            SPLIT_PART(C.order_number,'O',2) AS ORDER_NUMBER
    FROM {{ source('FROZENSYSTEM', 'TBLEMPLOYEE') }} A
    FULL  JOIN {{ source('FROZENSYSTEM', 'TBLTRANSACTIONS') }} B ON A.EMPLOYEE_ID = B.Emp_id
    FULL  JOIN {{ source('FROZENSYSTEM', 'TBLPAYMENTS') }} C ON C.payment_id = B.payment_id
    INNER JOIN {{ source('FROZENSYSTEM', 'TBLCUSTOMERS') }} D ON D.customer_id = B.customer_id
    GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
    ORDER BY 9 DESC
)

SELECT
    FIRST_NAME||' '||LAST_NAME AS EMPLOYEE_NAME,
    EMP_NUMBER AS EMPLOYEE_NUMBER,
    contact_number AS MOBILE_NO,
    CUSTOMER_ID AS CUST_ID,
    ORDER_ID AS ORDER_ID,Ś
    DATE_ORDER AS ORDER_DATE,
    QUANTITY AS QUANTITY,
    PRICE AS PRICE,
    CUST_NAME AS CUST_NAME,
    Products_id,
    ORDER_NUMBER,
    COUNT(CASE 
            WHEN Feed_status = 'Arrived' THEN QUANTITY 
          END) AS Food_Arrived,
    COUNT(CASE 
            WHEN Feed_status in ('Delayed','Missing') THEN QUANTITY 
          END) AS Food_Delayed,
    COUNT(CASE 
            WHEN Feed_status = 'Cancelled' THEN QUANTITY 
          END) AS Food_Cancelled,
    ('DBT_'|| TO_CHAR(SYSDATE(), 'YYYY_MM_DD_HH24_MI_SS')||'P1') AS BATCH_ID,
    SYSDATE() AS INSERT_DATE,
    'Vignesh_dbt_prod_909785' AS ETL_USER_ID
FROM CUSTOMER_DETAILSŚ
GROUP BY 1,2,3,4,5,6,7,8,9,10,11
