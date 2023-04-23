Choose the last person to fit the bus

select person_name from (select *, sum(weight) over(order by turn) as cum_sum
from queue) t1
where cum_sum <= 1000
order by cum_sum desc
limit 1
