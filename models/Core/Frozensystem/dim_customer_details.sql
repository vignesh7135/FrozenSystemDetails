{{
    config(
        materialized='table',
        store_failures = true
    )
}}
WITH CUSTOMER_DETAILS AS (
    SELECT  A.Employee_id,
            A.First_name,
            A.middle_name,
            A.last_name,
            A.contact_number,
            B.customer_id,
            {{ drop_id_field ('B.order_id') }} AS ORDER_ID,
            SPLIT_PART(C.order_number,'O',2) AS ORDER_NUMBER,
            C.date_order,C.quantity,C.price,
            CONCAT(D.FIRST_NAME, ' ', D.LAST_NAME) AS CUST_NAME, 
            D.phone_number
    FROM {{ source('FROZENSYSTEM', 'TBLEMPLOYEE') }} A
    FULL  JOIN {{ source('FROZENSYSTEM', 'TBLTRANSACTIONS') }} B ON A.EMPLOYEE_ID = B.Emp_id
    FULL  JOIN {{ source('FROZENSYSTEM', 'TBLPAYMENTS') }} C ON C.payment_id = B.payment_id
    INNER JOIN {{ source('FROZENSYSTEM', 'TBLCUSTOMERS') }} D ON D.customer_id = B.customer_id
    GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13
    ORDER BY 9 DESC
)

SELECT * FROM CUSTOMER_DETAILS
