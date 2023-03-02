select buyer_id from sales 
left join product using(product_id)
group by buyer_id
having sum(product_name = 'S8') > 0 and sum(product_name = 'iPhone') = 0

# 数符合条件的行数 having sum
# 注意sql里面的判断©️不是==
