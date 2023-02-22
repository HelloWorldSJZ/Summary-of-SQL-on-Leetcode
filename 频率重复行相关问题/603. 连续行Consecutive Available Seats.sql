select seat_id from cinema 
where free = 1 and
(seat_id - 1 in (select seat_id from cinema where free = 1) 
or
seat_id + 1 in (select seat_id from cinema where free = 1))



# 先self join成五个表，每个表里面筛选同时满足连续和free条件的id
select distinct a.seat_id
from cinema a join cinema b
  on abs(a.seat_id - b.seat_id) = 1
  and a.free = true and b.free = true
order by a.seat_id
