

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
