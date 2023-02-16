select name from employee
where id in 
(select managerId from employee
group by managerId
having count(managerId) >= 5)


# 用表格的不同列之间的联系选出另一个value
# select ... from ... where id in (subquery选出另一个符合条件的id list)
