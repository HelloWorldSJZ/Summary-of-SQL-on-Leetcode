select a.name as Employee from employee a
join employee b 
on a.managerid = b.id               -- people have managers
where a.salary > b.salary           -- employee whose salary is higher 


select E1.Name 
from Employee as E1, Employee as E2 
where E1.ManagerId = E2.Id and E1.Salary > E2.Salary
