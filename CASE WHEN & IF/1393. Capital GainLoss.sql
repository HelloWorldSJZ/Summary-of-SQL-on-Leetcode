select stock_name, sum(price*if(operation = 'Buy', -1, 1)) as capital_gain_loss
from stocks 
group by stock_name
