with cte as (select ad_id, 
        sum(if(action = 'Clicked',1,0)) as total_clicked,
        sum(if(action = 'Viewed',1,0)) as total_viewed
from ads
group by ad_id)

select ad_id, 
if((total_clicked+total_viewed) = 0, 
        0,round(total_clicked/(total_clicked+total_viewed) * 100,2)) as ctr
from cte
order by ctr desc, ad_id




#USE AVG to calculate the rate
SELECT ad_id, IFNULL(ROUND(AVG(CASE WHEN action = 'Clicked' THEN 1
                         WHEN action = 'Viewed' THEN 0
                         ELSE NULL END)*100,2),0) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id


IFNULL(exp1,exp2) means that if exp1 is null, replace with exp2; otherwise return exp1.
