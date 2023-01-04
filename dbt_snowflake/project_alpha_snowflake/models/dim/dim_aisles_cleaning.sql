--SQL
--Create a dim table name dim_aisles_cleaning referring to the scr_aisles table in src layer
--Trim the aisle column and remove the space in the beginning and end of the aisle column

WITH src_aisles as (
    select * from {{ ref('src_aisles') }}
)
SELECT
    aisle_id,
    TRIM(aisle) as aisle
from src_aisles
