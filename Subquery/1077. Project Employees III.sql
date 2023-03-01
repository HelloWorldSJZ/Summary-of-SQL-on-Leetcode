

# 如果有不同组之间找max的，可以两个factor一起 where ... in ...
select p.project_id, p.employee_id from project p
left join employee e
on p.employee_id = e.employee_id
where (p.project_id, e.experience_years) in (select a.project_id, max(b.experience_years)
    from Project a join Employee b
    on a.employee_id = b.employee_id
    group by a.project_id)
    
    
# Window function 

with employee_experience as (
    select p.project_id, p.employee_id,
    rank() over(partition by p.project_id order by experience_years desc) as rk
    from Project p join Employee e
    on p.employee_id = e.employee_id)

select project_id, employee_id
from employee_experience
where rk = 1;
