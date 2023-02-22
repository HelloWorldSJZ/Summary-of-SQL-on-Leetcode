select actor_id, director_id from actordirector 
group by actor_id,director_id
having count(actor_id) >=3

-- 找两行相等且重复的，只需两个group by
