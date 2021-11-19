{{ config(materialized='table') }}
 
with source_data as (
select 
    S_No,
    Std_Id,
    Marks,
    Result 
 from {{ source('FROZENSYSTEM', 'student_results') }}
 
)
 
select *
from source_data