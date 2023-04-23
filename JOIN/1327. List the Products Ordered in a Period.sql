select product_name, sum(unit) unit 
from products p
left join orders o
on p.product_id = o.product_id
where date_format(order_date,'%Y-%m') = '2020-02'
group by p.product_id
having unit >= 100
