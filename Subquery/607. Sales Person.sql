select name from salesperson 
where sales_id not in 
    (
        Select sales_id from orders o where o.com_id = 
        (select c.com_id from company c where name = "RED")
    )
        
