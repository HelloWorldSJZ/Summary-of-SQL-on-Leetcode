Input: 
Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+

Cross Join is to combine every row in a tabel to every row of another table. 

select * from students s 
(cross) join subjects j 

The query above would give the result below. 
+------------+--------------+------------+
|student_id | student_name | subject_name | 
+------------+--------------+--------------+
| 1          | Alice        | Math         |
| 1          | Alice        | Physics      | 
| 1          | Alice        | Programming  | 
| 2          | Bob          | Math         | 
| 2          | Bob          | Physics      | 
| 2          | Bob          | Programming  | 
| 6          | Alex         | Math         | 
| 6          | Alex         | Physics      | 
| 6          | Alex         | Programming  | 
| 13         | John         | Math         | 
| 13         | John         | Physics      | 
| 13         | John         | Programming  |



select s.student_id,
        s.student_name,
        j.subject_name, count(e.subject_name) attended_exams from students s
cross join subjects j
left join examinations e 
on s.student_id = e.student_id
and j.subject_name = e.subject_name !!
group by s.student_id, j.subject_name
order by s.student_id, j.subject_name



1. Be careful to count the exam.subject_name since there is no null for s.student_id or j.subject_name
2. Make sure to have two conditions when joining since we want the number of attendence of every subject for each student 
