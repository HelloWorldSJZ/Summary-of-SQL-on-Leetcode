Situation: asked to sum the amount with different group conditions:

with tab1 as 
(SELECT LEFT(chargebacks.trans_date, 7) AS month, country, "back" AS state, amount
    FROM chargebacks
    JOIN transactions ON chargebacks.trans_id = transactions.id
union all
SELECT LEFT(trans_date, 7) AS month, country, state, amount
    FROM transactions
    WHERE state = "approved")

'back' as state adds a column directly

select month, country, sum(state='approved') approved_count, sum(if(state = 'approved',amount,0)) approved_amount,
        sum(state = 'back') chargeback_count, sum(if(state = 'back',amount,0)) chargeback_amount
from tab1 
group by month, country

Dont calculate the count and amount before union. The columns would be different for union.
