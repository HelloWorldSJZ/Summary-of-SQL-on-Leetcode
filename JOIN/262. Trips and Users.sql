select request_at as Day, 
        round(sum(if(status != "completed",1,0)) / count(*), 2)         -- 注意此处的count(*)会因为后面的on和group by条件减少到unbanned people
        as "Cancellation Rate" from trips t
        join users c on trips.client_id = c.users_id and c.banned = 'No'        -- join的两个users要重命名
        join users d on trips.driver_id = d.users_id and d.banned = 'No' 
        where request_at between '2013-10-01' and '2013-10-03'
        group by request_at
        
        




