select player_id, device_id 
from Activity  
where (player_id, event_date) in 
       (select player_id, min(event_date) from Activity
       group by player_id)
当player id和event date是最早的时候选出对应的device id


# Window function 
select distinct player_id, first_value(device_id) 
                  over (partition by player_id order by event_date) 
                  as device_id
                  from activity
                 



# Rank
SELECT player_id
        ,device_id
FROM 
    (SELECT player_id
            ,device_id
            ,rank() OVER(PARTITION BY player_id ORDER BY event_date) AS rnk
    FROM Activity) rnk_table
WHERE rnk_table.rnk = 1
先给table的每个group进行排序，然后选出每个group第一行的id

