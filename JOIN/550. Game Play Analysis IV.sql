# 搞两个table, 一个是不变的（分母），一个join filter过的（分子）
SELECT 
    ROUND((SELECT COUNT(DISTINCT a.player_id) 
           FROM Activity AS a, (SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id) AS b 
           WHERE a.player_id = b.player_id AND DATEDIFF(a.event_date, b.first_login) = 1)
             /(SELECT COUNT(DISTINCT player_id) FROM Activity)
          , 2)
    AS fraction
    
    
    
SELECT ROUND(COUNT(t2.player_id)/COUNT(t1.player_id),2) AS fraction
FROM 
(SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id) t1 # 选出每个player的first login date
LEFT JOIN Activity t2                                                                  # 用join filer出连续两天login的id
ON t1.player_id = t2.player_id AND t1.first_login = t2.event_date - 1
