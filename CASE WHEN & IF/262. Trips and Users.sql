select request_at as Day,
    round(sum(if(status != 'completed',1,0)) / count(*),2) 
    as 'Cancellation Rate' from trips
    join users c on trips.client_id = c.users_id and c.banned = 'No' 
    join users d on trips.driver_id = d.users_id and d.banned = 'No' 
    where request_at between '2013-10-01' and '2013-10-03'
group by request_at
-- 计算cancellation rate的时候可以先不考虑group by和一系列条件，在后面列出即可
-- 两行join对前面count（*）的内容进行限制
-- 非常老美思想的题了可以说是 0.0
