select d.name as Department, e.name as Employee
from employee as e
left join department as d
on e.departmentid = d.id

-- 先把每个人对应的部门输入
{"headers": ["Department", "Employee"], "values": [["IT", "Joe"], ["IT", "Jim"], ["Sales", "Henry"], ["Sales", "Sam"], ["IT", "Max"]]}
