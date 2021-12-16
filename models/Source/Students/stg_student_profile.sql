{{ config(materialized='table') }}
 
with source_data as (
select 
    S_No,
    Std_Id,
    Std_Name,
    Std_Dep,
    DOB
 from {{ source('FROZENSYSTEM', 'student_profile') }}
 
)
 
select *
from source_data