--SQL
--Create a dim table name dim_department_cleaning referring to the scr_department table in src layer
--Trim the department column and remove the space in the beginning and end of the aisle column

with src_departments as(
    select * 
    from {{ ref('src_departments') }}
    )
select
    department_id,
    trim(department) as department
from src_departments