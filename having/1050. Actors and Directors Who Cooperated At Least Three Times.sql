select actor_id, director_id from actordirector 
group by actor_id, director_id
having count(*) >= 3 




select actor_id, director_id, count(timestamp) over (partition by actor_id, director_id) 
from actordirector 
 actor_id | director_id | count(timestamp) over (partition by actor_id, director_id) |
| -------- | ----------- | ---------------------------------------------------------- |
| 1        | 1           | 3                                                          |
| 1        | 1           | 3                                                          |
| 1        | 1           | 3                                                          |
| 1        | 2           | 2                                                          |
| 1        | 2           | 2                                                          |
| 2        | 1           | 2                                                          |
| 2        | 1           | 2                                                          |


select actor_id, director_id, count(timestamp) from actordirector 
group by actor_id, director_id
| actor_id | director_id | count(timestamp) |
| -------- | ----------- | ---------------- |
| 1        | 1           | 3                |
| 1        | 2           | 2                |
| 2        | 1           | 2                |
