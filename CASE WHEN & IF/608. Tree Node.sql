select id, 
    case when p_id is null then 'Root' 
        when p_id is not null and id in (select p_id from tree) then 'Inner' else
        'Leaf' 
    end as type
from tree order by id; 

-- CASE WHEN类最注重分类讨论思想
-- case when xx then xx
--      when xx then xx else 
--      xx
-- end 
        
