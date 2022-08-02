select 
if(id mod 2 <> 0,
   if(id = (select max(id) from seat),id, id+1 ),
   id-1) id,student from seat
order by id
    
-- 注意id mod 2要是第一个条件，因为余数不等于0是，可以讨论max id的情况。如果先讨论是不是max id，还要再讨论这个id是否odd or even；
