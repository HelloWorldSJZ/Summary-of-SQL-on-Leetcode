select author_id as id from views
where author_id = viewer_id
group by author_id
having count(*) >= 1
order by id

select distinct author_id as id from views
where author_id = viewer_id
order by id
