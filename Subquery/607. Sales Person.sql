select s.name from salesperson s
where s.sales_id not in 
    (
        Select o.sales_id from orders o where o.com_id = 
        (select c.com_id from company c where name = "RED")
    )
        
