select t1.player_id, t1.event_date, sum(t2.games_played) as games_played_so_far
from activity as t1
inner join activity as t2 
on t1.event_date >= t2.event_date     # innerjoin 筛选出所有符合条件的行
and t1.player_id = t2.player_id       # 筛选出所有比这个日期小或者相等的行，并留下小日期对应的# of games以便做加减
group by t1.player_id, t1.event_date  # 分player_id和event_date求和



# 从PDF到Cumulative求和的问题
