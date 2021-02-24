

CHAPTER 4
QUIZ : SUBQUERY MANIA
SQL SCHEMATIC : https://s3.console.aws.amazon.com/s3/upload/sanwal-bucket-01?region=us-east-1



#1
"""
Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
"""

SELECT sales_rep_name, region_name, MAX(total_amt_usd)
FROM

  (SELECT s.name sales_rep_name,
         r.name region_name,
         sum(o.total_amt_usd) total_amt_usd
  FROM sales_reps s
  JOIN accounts a
  ON a.sales_rep_id = s.id
  JOIN orders o
  ON a.id = o.account_id
  JOIN region r
  ON r.id = s.region_id
  GROUP BY s.name, r.name) sales_rep_usd

GROUP BY sales_rep_name, region_name;

#2
"""
For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were
placed?"""

SELECT region_name,
       COUNT(*)
FROM

  (SELECT r.name region_name,
         a.name account_name,
         o.total_amt_usd total_order_amt
  FROM region r
  JOIN sales_reps s
  ON r.id = s.region_id
  JOIN accounts a
  ON a.sales_rep_id = s.id
  JOIN orders o
  ON o.account_id = a.id
  GROUP BY r.name, a.name, o.total_amt_usd) region_sales

GROUP BY region_name
ORDER BY COUNT(*);


#3
"""
How many accounts had more total purchases than the account name which has bought the most
standard_qty paper throughout their lifetime as a customer?
"""

SELECT COUNT(*)
FROM
(
  SELECT a.name
  FROM orders o
  JOIN accounts a
  ON a.id = o.account_id
  GROUP BY a.name
  HAVING SUM(o.total) > (

      SELECT total
      FROM

        (SELECT a.name account_name,
               SUM(o.standard_qty) standard_qty,
               SUM(o.total)total
        FROM accounts a
        JOIN orders o
        ON a.id = o.account_id
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 1) total_table)

      )count_table;


#4
"""
For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd,
how many web_events did they have for each channel?
"""

SELECT a.name acct_name,
      w.channel channel_name,
      COUNT(*) num_events
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
AND a.name =

  (SELECT account_name
    FROM

      (SELECT a.name account_name,
             SUM(o.total_amt_usd) total_spent
      FROM accounts a
      JOIN orders o
      ON o.account_id = a.id
      GROUP by 1
      ORDER BY 2 DESC
      LIMIT 1) max_spent_acct
    )
  GROUP BY  1 ,2;

#5
"""What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending
 accounts?"""

SELECT ROUND(AVG(total_$_spent),3)
FROM
  (SELECT a.name account_name,
          SUM(o.total_amt_usd) total_$_spent
  FROM accounts a
  JOIN orders o
  ON o.account_id = a.id
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 10) amt_spent;


  #6
  """
What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that
spent more per order, on average, than the average of all orders.

  """
SELECT ROUND(AVG(amt_spent),3)
FROM(

  SELECT a.name account_name,
         SUM(o.total_amt_usd) amt_spent
  FROM orders o
  JOIN accounts a
  ON a.id = o.account_id
  AND o.total_amt_usd > (

      SELECT AVG(o.total_amt_usd) avg_all
      FROM orders o)
  GROUP BY 1
  ORDER by 2 DESC
)total_spent_avg;
