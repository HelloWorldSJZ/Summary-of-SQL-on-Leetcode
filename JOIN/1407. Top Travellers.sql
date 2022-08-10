select u.name, ifnull(sum(r.distance),0) as "travelled_distance" from users u 
left join rides r
on u.id = r.user_id 
group by u.id                   -- 最后是用id分组，名字会有重复的
order by travelled_distance desc, name

ifnull(expression_1, expression_2)
如果expression_1是错的，return expression_2
