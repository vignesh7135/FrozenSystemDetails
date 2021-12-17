{{
    config(
        schema= 'dbt_forzensystem',
        materialized='table',
        tags=["customer_data"]
    )
}}
SELECT 
    employee_name,
    employee_number,
    mobile_no,
    cust_id,
    order_id,
    order_date,
    quantity,
    price,
    cust_name,
    products_id,
    food_arrived,
    food_delayed,
    food_cancelled
FROM {{ ref('vw_customer_velocity') }}
WHERE QUANTITY > 3 AND ORDER_DATE BETWEEN '1970-02-28' AND CURRENT_DATE - 1
HAVING PRICE > 1000