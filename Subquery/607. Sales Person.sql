select s.name from salesperson s
where s.sales_id not in 
    (
        Select o.sales_id from orders o where o.com_id = 
        (select c.com_id from company c where name = "RED")
    )
        


Select o.sales_id from orders o where o.com_id = 
        (select c.com_id from company c where name = "RED")
        
==

SELECT sales_id FROM orders
LEFT JOIN
company 
ON orders.com_id=company.com_id 
WHERE company.name='RED'
