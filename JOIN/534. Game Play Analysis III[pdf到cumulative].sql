select t1.player_id, t1.event_date, sum(t2.games_played) as games_played_so_far
from activity as t1
inner join activity as t2 
on t1.event_date >= t2.event_date
and t1.player_id = t2.player_id
group by t1.player_id, t1.event_date


# inner
