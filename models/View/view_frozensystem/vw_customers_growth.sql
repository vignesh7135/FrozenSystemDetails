SELECT
    A.*
    FROM
    {{ ref('vw_customer_velocity') }} A
LEFT JOIN
    (
        SELECT
            id ,
            Payment_Id,
            (price/( SELECT Avg(price) FROM {{ source('FROZENSYSTEM', 'TBLORDER') }}  )) AS PRICE
        FROM {{ source('FROZENSYSTEM', 'TBLORDER') }}
        GROUP BY 
        1,2,3

    ) B
    ON A.ORDER_ID = B.ID 
    WHERE QUANTITY > 3 AND ORDER_DATE > '1970-02-28' 