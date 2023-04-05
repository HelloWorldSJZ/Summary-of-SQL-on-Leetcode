select a.student_id, a.course_id, a.grade
from 
(select *, rank() over(partition by student_id order by grade desc, course_id) as rnk
from Enrollments) a
where a.rnk = 1
order by a.student_id
