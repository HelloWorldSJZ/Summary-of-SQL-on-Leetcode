select activity_date as day, count(distinct user_id) as active_users from activity
where (activity_date > '2019-06-27' and activity_date <= '2019-07-27')
group by activity_date

-- 数重复行用count即可，有条件的时候用having count > or < or =
