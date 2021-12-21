{{
  config({
    'tags': "customer_data"
  })
}}
WITH DISCOUNTS AS (
    SELECT
        A.*
    FROM {{ source('FROZENSYSTEM', 'TBLORDER') }} A
    LEFT JOIN 
    {{ source('FROZENSYSTEM', 'TBLPAYMENTS') }} B
    ON A.Payment_id = B.Payment_id
    GROUP BY 1,2,3,4,5,6
    HAVING 
    A.QUANTITY > 2 AND ((A.price/(Avg(A.price) )))

)
SELECT
    A.*
FROM {{ ref('intm_customer_details') }} A
LEFT JOIN DISCOUNTS B ON A.CUST_ID = B.CUSTOMER_ID
                   AND A.ORDER_ID = B.id
                   where A.QUANTITY > 3