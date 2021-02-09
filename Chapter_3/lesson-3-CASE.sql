


CHAPTER 3
QUIZ : CASE

#1 """ Write a query to display for each order, the account ID, total amount of
  the order, and the level of the order - ‘Large’ or ’Small’
  - depending on if the order is $3000 or more, or smaller than $3000."""

SELECT account_id, total_amt_usd,

  CASE WHEN total_amt_usd > 3000 THEN 'Large'
  ELSE 'Small' END as order_type

FROM orders;


#2 """Write a query to display the number of orders in each of three categories,
 based on the total number of items in each order. The three categories are:
 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'."""

SELECT CASE WHEN total_amt_usd < 1000 THEN 'Less than 1000'
            WHEN total_amt_usd > 1000 and total_amt_usd <2000 THEN 'Between 1000 and 2000'
            ELSE 'At Least 2000' END category,
            COUNT(*) order_count
FROM orders
GROUP BY 1;


#3 """We would like to understand 3 different levels of customers based on the
amount associated with their purchases. The top level includes anyone with a
Lifetime Value (total sales of all orders) greater than 200,000 usd. The second
evel is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd.
Provide a table that includes the level associated with each account. You should
Provide the account name, the total sales of all orders for the customer, and the level.
Order with the top spending customers listed first. """
SELECT a.name  account_name,
       SUM(o.total_amt_usd) total_amt_spent,
       CASE  WHEN  SUM(o.total_amt_usd) <= 100000 THEN 'Lowest'
             WHEN  SUM(o.total_amt_usd) > 100000 AND  SUM(o.total_amt_usd) < 200000 THEN 'Medium'
             ELSE 'Highest' END lifetime_value
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC;

#4 """We would now like to perform a similar calculation to the first, but we want
 to obtain the total amount spent by customers only in 2016 and 2017. Keep the same
 levels as in the previous question. Order with the top spending customers listed
 first."""

 SELECT a.name  account_name,
        SUM(o.total_amt_usd) total_amt_spent,
        CASE  WHEN  SUM(o.total_amt_usd) <= 100000 THEN 'Lowest'
              WHEN  SUM(o.total_amt_usd) > 100000 AND  SUM(o.total_amt_usd) < 200000 THEN 'Medium'
              ELSE 'Highest' END lifetime_value
 FROM accounts a
 JOIN orders o
 ON a.id = o.account_id
 WHERE o.occurred_at > '12-31-2015'
 GROUP BY 1
 ORDER BY 2 DESC;



#5 """We would like to identify top performing sales reps, which are sales reps
associated with more than 200 orders. Create a table with the sales rep name, the
total number of orders, and a column with top or not depending on if they have more
 than 200 orders. Place the top sales people first in your final table."""

 SELECT s.name rep_name,
        count(*) num_orders,
        CASE WHEN count(*) > 200 OR SUM(o.total_amt_usd)>750000 THEN 'Top'
             WHEN count(*) >150 OR SUM(o.total_amt_usd)>500000 THEN 'Middle'
        ELSE 'Not' END as top_or_not
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY num_orders DESC;
