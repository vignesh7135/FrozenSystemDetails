--******************VERSION MODIFICATION********************************************************************
--* NAME: wwe_cross_join_check
--* QA Analyst: Smitha
--* DATE: Created on 2021June23 for DataOps POC project
--* DESCRIPTION: This macro is for the cross join check listed in Mandatory tests list for aggregate tables
--**********************************************************************************************************
/* date | by | Details */
/* Jun/23/2021 | Smitha | Jira Ticket# DDO-237 This macro is for the cross join check listed in Mandatory tests list for aggregate tables. 
                                               This accepts a source query and target query as parameters and retruns a value if the target query count is greater, hence failing the test in that case*/

{% macro wwe_cross_join_check(a_query, b_query, primary_key=None) %}

with 
a as (    {{ a_query }} ),

b as (    {{ b_query }} ),

a_count as ( select count(*) as  cnt from a),
b_count as ( select count(*) as  cnt from b)


select * from (
select case when b.cnt > a.cnt then  1  end  as out_count
from a_count a ,b_count b )
where out_count is not null

{% endmacro %}
