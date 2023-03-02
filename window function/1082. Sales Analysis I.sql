select seller_id from 
    (select seller_id, rank() over(order by profit desc) as rk
    from 
        (select seller_id, sum(price) profit 
            from sales group by seller_id) total) p
                where rk = 1
 
 
 # 找最大值同时有好几个的时候
 
 
 with total as (select seller_id, sum(price) profit 
        from sales group by seller_id)

select seller_id from total
where profit = (select max(profit) from total)

筛选出所有=最大值的
 
