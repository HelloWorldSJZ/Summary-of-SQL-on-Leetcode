
select book_id, name from books 
where available_from < '2019-05-23'
and book_id not in (
  select book_id from orders 
  where dispatch_date between '2018-06-23' and '2019-06-23'
  group by book_id 
  having sum(quantity) >= 10
)

想要找去年销量<10的书，可以用not in筛选出去年销量大于10的

select b.book_id, b.name
from books b left join
    (select book_id, sum(quantity) as book_sold
    from Orders 
    where dispatch_date between '2018-06-23' and '2019-06-23'
    group by book_id) t
on b.book_id = t.book_id
where available_from < '2019-05-23'
and (book_sold is null or book_sold <10)
先把dispatch date过滤掉 然后join books table
