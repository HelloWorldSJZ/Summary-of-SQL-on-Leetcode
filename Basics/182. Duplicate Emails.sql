SELECT DISTINCT a.Email FROM Person a 
JOIN Person b
 ON (a.Email = b.Email)
 WHERE a.Id <> b.Id
 -- 找出表格a版中不重复的email
 -- 以id为合并key
 -- 选出a版中和b版id不一样但是重复的email
 
 SELECT email FROM person group by email having count(*) > 1
 -- having count用于分组后过滤的条件

-- 底层逻辑和586. Customer Placing the Largest Number of Orders很像，都是找一列里面重复的row
-- 本题是寻找重复2次以上的，586是找重复最多的
