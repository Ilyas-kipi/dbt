{{
    config(
        materialized='incremental',
        unique_key='ID'
    )
}}

with emp_cte as (

    select * from {{ ref('stg_employees') }}

    {% if is_incremental() %}
    where id > (select max(id) from {{ this }} )
    {% endif %}
)

select * from emp_cte