with emp_cte as (

    select * from {{ source('employees', 'employees') }}
)

select * from emp_cte