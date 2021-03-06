LESSON 3

EXERCISE
Questions: DATES PART 1
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png

#1
SELECT DATE_PART('YEAR',o.occurred_at) year_order ,
       SUM(o.total_amt_usd) total_order_amt
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

#2
SELECT DATE_PART('month',o.occurred_at) month_order ,
       SUM(o.total_amt_usd) total_order_amt
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

#3
SELECT DATE_PART('YEAR',o.occurred_at) year_of_order ,
       COUNT(*) year_total_order
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

#4

SELECT a.id account_id,
       a.name account_name,
       DATE_PART('MONTH',o.occurred_at) month_order ,
       COUNT(*) year_total_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1,2,3
ORDER BY 4
LIMIT 1;


#5
