


CHAPTER 3
QUIZ : CASE
SQL schematic -: https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


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
