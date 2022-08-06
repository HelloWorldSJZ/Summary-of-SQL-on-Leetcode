select c.name as Customers from customers c
left join orders o 
on c.id = o.customerid
where o.id is null      -- left join后，order里面的id有两个是null; customers id是按照原来的样子


select o.id, c.name as Customers from customers c
left join orders o 
on c.id = o.customerid

OUTPUT:
{"headers": ["id", "Customers"], 
"values": [[2, "Joe"], 
          [null, "Henry"], 
          [1, "Sam"], 
          [null, "Max"]]}
          
          
          
{"headers": ["id", "Customers"],
"values": [[1, "Joe"], 
          [2, "Henry"], 
          [3, "Sam"], 
          [4, "Max"]]}
