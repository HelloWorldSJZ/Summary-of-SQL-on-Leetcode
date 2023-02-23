# The FOREIGN KEY constraint prevents invalid data from being inserted into the foreign key column, 
# because it has to be one of the values contained in the parent table.

select customer_id 
from customer group by customer_id
having count(distinct product_key) = (select count(*) from product)

# foreign key限制了所有parent table的数字都会在product table里面出现
