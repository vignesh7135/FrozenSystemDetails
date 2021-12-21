--******************VERSION MODIFICATION********************************************************************
--* NAME: wwe_compare_queries_counts
--* QA Analyst: Smitha
--* DATE: Created on 2021June23 for DataOps POC project
--* DESCRIPTION: This macro is for the count check between 2 queries
--**********************************************************************************************************
/* date | by | Details */
/* Jun/23/2021 | Smitha | Jira Ticket#  This macro is for the count comparison between 2 queries
                                        This accepts a source query and target query as parameters and retruns a value if the counts vary*/
{%- macro queries_counts(a_query, b_query, primary_key=None) -%}

with
a as (    {{ a_query }} ),
b as (    {{ b_query }} ),
a_count as ( select count(*) as  cnt from a),
b_count as ( select count(*) as  cnt from b)
select * from (
select case when a.cnt <> b.cnt then  1  end  as count_mismatch
from a_count a ,b_count b )
where count_mismatch is not null

{%- endmacro -%}
