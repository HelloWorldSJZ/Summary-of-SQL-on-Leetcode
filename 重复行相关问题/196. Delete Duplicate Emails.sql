Delete from person 
where id not in (select * from (select min(id) from person group by email) as p);

-- 注意要有as p（alias）否则报错
