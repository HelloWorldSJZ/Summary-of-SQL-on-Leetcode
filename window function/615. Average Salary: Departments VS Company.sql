select distinct(DATE_FORMAT(pay_date, '%Y-%m')) as pay_month, department_id, 
        case when avg_com < avg_dep then 'higher'
             when avg_com > avg_dep then 'lower'
        else 'same'
end as comparison
from (select pay_date, department_id,  
            avg(amount) over (partition by pay_date) as avg_com, 
            avg(amount) over (partition by pay_date, department_id) as avg_dep
        from salary s
        left join employee e
        on s.employee_id = e.employee_id) p 




select pay_date, department_id,  
            avg(amount) over (partition by pay_date) as avg_com, 
            avg(amount) over (partition by pay_date, department_id) as avg_dep
        from salary s
        left join employee e
        on s.employee_id = e.employee_id
        
| pay_date   | department_id | avg_com   | avg_dep |
| ---------- | ------------- | --------- | ------- |
| 2017-02-28 | 1             | 7000      | 7000    |
| 2017-02-28 | 2             | 7000      | 7000    |
| 2017-02-28 | 2             | 7000      | 7000    |
| 2017-03-31 | 1             | 8333.3333 | 9000    |
| 2017-03-31 | 2             | 8333.3333 | 8000    |
| 2017-03-31 | 2             | 8333.3333 | 8000    |
