# Approach 1 Window Function
with max_gra as (select *, max(grade) over (partition by student_id) as max_g from enrollments)

select student_id, min(course_id) course_id, grade from max_gra
where grade = max_g
group by student_id
order by student_id


# Approach 2 Subquery
select student_id, min(course_id) course_id, grade 
from enrollments
where (student_id, grade) in (
  select student_id, max(grade) from enrollments
  group by student_id
)
group by student_id
order by student_id

当有两个分类事项（course&student）时并且筛选条件时另一个factor时，要用一个分类事项和factor夹出符合条件的事项2
