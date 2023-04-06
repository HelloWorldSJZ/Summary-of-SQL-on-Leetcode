
with cte as ((select country_name, 
       avg(weather_state) over (partition by w.country_id, date_format(day, '%Y-%m')) as avg 
from weather w
left join countries c
on w.country_id = c.country_id
where date_format(day, '%Y-%m') = '2019-11'))

select distinct country_name, 
       case when avg <=15 then 'Cold'
       when avg >= 25 then 'Hot'
       else 'Warm'
       end as weather_type
from cte 
