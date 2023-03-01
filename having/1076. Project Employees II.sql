# max出现在了不同的id里
select project_id from project 
group by project_id
having(count(project_id)) = (select count(project_id) count
    from project 
    group by project_id 
    order by count desc
    limit 1)
