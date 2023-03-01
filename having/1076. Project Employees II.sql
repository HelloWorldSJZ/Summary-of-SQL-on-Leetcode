# max出现在了不同的id里
select project_id from project 
group by project_id
having count(employee_id) = (select count(employee_id) countfrom project 
    group by project_id 
    order by count desc
    limit 1)



select project_id
from
(select project_id, 
        rank() over(order by count(employee_id) desc) as rk 
from Project
group by project_id) t
where rk = 1
