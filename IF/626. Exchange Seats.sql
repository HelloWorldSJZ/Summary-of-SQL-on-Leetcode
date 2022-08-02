select 
if(id mod 2 <> 0,
   if(id = (select max(id) from seat),id, id+1 ),
   id-1) id,student from seat
order by id
    
