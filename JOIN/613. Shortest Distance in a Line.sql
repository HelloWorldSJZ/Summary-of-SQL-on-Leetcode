select min(abs(x1-x2)) shortest from (
    select t1.x x1, t2.x x2 from point t1
    join point t2 on t1.x != t2.x) t3
    
# using abs function in sql would make it run slowly

SELECT MIN(a.x - b.x) AS shortest
FROM point a, point b
WHERE a.x > b.x;

# filter the bigger x and then do the minus calculation for the distance
