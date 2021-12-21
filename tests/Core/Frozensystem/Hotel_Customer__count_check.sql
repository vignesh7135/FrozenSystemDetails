/*--******************VERSION MODIFICATION**************************************************************
--* NAME: Hotel_Customer__count_check
--* QA Analyst: Vignesh
--* DATE: Created on 2021 Dec17 for Hotel_Customers
--* DESCRIPTION: This validates the count of aggr_dtops_daily_data360 table
--*****************************************************************************************************/
/* date | by | Details */
/* Dec/15/2021 | Vignesh | This validates the count of aggr_dtops_daily_data360 table
*/


{{
  config({
    'tags': "customer_data"
  })
}}
{%set a_query %} 
SELECT COUNT(*) FROM(
    SELECT
        EMPLOYEE_NUMBER,
        MOBILE_NO,
        CUST_ID,
        ORDER_ID,
        PRODUCT_ID
    FROM
        {{ref('intm_customer_details')}} )
{% endset %}

{%set b_query %} 
SELECT COUNT(*) FROM(    
    SELECT
        EMPLOYEE_NUMBER,
        MOBILE_NO,
        CUST_ID,
        ORDER_ID,
        PRODUCT_ID 
    FROM
            {{ref('Hotel_Customers')}} )
{% endset %}
{{ queries_counts(
    a_query = a_query,
    b_query = b_query 
) }}
