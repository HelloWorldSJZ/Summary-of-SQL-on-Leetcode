select *
from cinema
where id%2 = 1
and description NOT LIKE '%boring%'
order by rating desc

-- 注意此处用 %% 而非 <> or !=
