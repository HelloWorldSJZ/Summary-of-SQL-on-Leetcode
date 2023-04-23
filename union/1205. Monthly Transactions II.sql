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


refer: https://leetcode.com/problems/monthly-transactions-ii/solutions/1367877/simplest-mysql-solution-with-detailed-explanation/

id	country	state	amount	month
101	US	approved	1000	2019-05
103	US	approved	3000	2019-06
105	US	approved	5000	2019-06



trans_id	country	state	amount	month
102	US	chargeback	2000	2019-05
101	US	chargeback	1000	2019-06
105	US	chargeback	5000	2019-09



id	country	state	amount	month
101	US	approved	1000	2019-05
103	US	approved	3000	2019-06
105	US	approved	5000	2019-06
102	US	chargeback	2000	2019-05
101	US	chargeback	1000	2019-06
105	US	chargeback	5000	2019-09
