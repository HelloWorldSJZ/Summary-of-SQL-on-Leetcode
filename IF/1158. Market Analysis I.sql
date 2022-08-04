select u.user_id as buyer_id, u.join_date, 
       ifnull(count(o.order_date),0) as orders_in_2019 from users u
left join orders o
on u.user_id = o.buyer_id
and o.order_date between '2019-01-01' and '2019-12-31'
group by u.user_id

-- 注意用on 和 where的区别
-- When you have a join, you are saying that the relationship between the two tables is defined by that condition. 
-- So in your first example you are saying that the tables are related by cd.Company = table2.Name AND table2.Id IN (2728). 
-- 用on，同时满足两个条件才能join

-- When you use the WHERE clause, you are saying that the relationship is defined by cd.Company = table2.Name 
-- and that you only want the rows where the condition table2.Id IN (2728) applies
-- 用where，on后的条件满足即可join，但是会过滤掉不满足where语句的行，这些行不会出现
