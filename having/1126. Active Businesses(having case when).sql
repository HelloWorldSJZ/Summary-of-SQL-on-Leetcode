with average as (
    select *, avg(occurences) over (partition by event_type) as mean from events
)


select business_id from average 
group by business_id
having sum(CASE WHEN occurences > mean THEN 1 ELSE 0 END) > 1

# having SUM(IF(occurences > mean,1,0)) > 1
