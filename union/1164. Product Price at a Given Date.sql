两种极端情况用union

with cte as (
    select max(change_date) as date, product_id as id
    from Products 
    where change_date <= '2019-08-16'
    group by product_id) 
    
select distinct P.product_id, new_price as price 
from Products P 
where (P.change_date, P.product_id) in (select * from cte)
union all 
select distinct P.product_id, 10 as price 
from Products P 
where P.product_id not in (select id from cte)
