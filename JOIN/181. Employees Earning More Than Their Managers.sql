select a.name as Employee from employee a
join employee b 
on a.managerid = b.id               -- people have managers
where a.salary > b.salary           -- employee whose salary is higher 
