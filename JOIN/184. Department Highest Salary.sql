select d.name as Department, e.name as Employee
from employee as e
left join department as d
on e.departmentid = d.id

-- 先把每个人对应的部门输入
{"headers": ["Department", "Employee"], "values": 
            [["IT", "Joe"], 
             ["IT", "Jim"], 
             ["Sales", "Henry"], 
             ["Sales", "Sam"], 
             ["IT", "Max"]]}

select d.name as Department, e.name as Employee
from employee as e
left join department as d
on e.departmentid = d.id
having Salary = (select max(salary) from employee a 
                where a.departmentid = d.id)          -- where 后的句子限制department之内相互比较



SELECT D.Name AS Department ,E.Name AS Employee ,E.Salary 
from 
	Employee E,
	Department D 
WHERE E.DepartmentId = D.id 
  AND (DepartmentId,Salary) in 
  (SELECT DepartmentId,max(Salary) as max FROM Employee GROUP BY DepartmentId)
  
  
  -- 执行顺序：from...where...group by...having...select...order by...limit...
