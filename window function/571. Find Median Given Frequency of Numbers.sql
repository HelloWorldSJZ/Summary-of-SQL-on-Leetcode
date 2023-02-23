with a as (
    select num,
           sum(frequency) over (order by num) - frequency as lower_num,
           sum(frequency) over (order by num) as upper_num,
           sum(frequency) over () / 2 as medium_num
    from numbers 
)

select avg(num) as median
from a
where medium_num between lower_num and upper_num


# sum(freq) over(order by num) gives the cumulative frequency
# 找到每个freq对应的区间，0-7，7-8，8-11，11-12
# 找到原本的median
# 因为区间是包含的，两个interval会share区间，用avg平均
