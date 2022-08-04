select  case when id = (select max(id) from seat) and id%2 != 0 then id
             when id%2 = 1 then id + 1 
             else id - 1
        end as id,
        student 
from seat 
order by id

-- 换名字可以转换思路换id！！！
-- id不能直接等于 max(id) 
