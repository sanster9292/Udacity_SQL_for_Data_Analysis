CHAPTER 4
QUIZ : WITH
SQL SCHEMATIC : https://s3.console.aws.amazon.com/s3/upload/sanwal-bucket-01?region=us-east-1

# 1
"""
Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
"""

WITH t1 AS (

    SELECT s.name sales_rep,
           r.name region_name,
          SUM(o.total_amt_usd) total_amt_usd
    FROM sales_reps s
    JOIN region r
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    JOIN orders o
    ON o.account_id = a.id

    GROUP BY 1,2
    ORDER BY  3 DESC
),
    t2 AS(
        SELECT region_name,
               MAX(total_amt_usd) max_amt_spent
        FROM t1
        GROUP BY 1
    )

SELECT t1.sales_rep, t1.region_name,
       t2.max_amt_spent
FROM t1
JOIN t2
ON t1.region_name = t2.region_name
AND t1.total_amt_usd = t2. max_amt_spent;

"""# Explanation
Here, in the first table, I selected the region with the sales reps and the
total amount their sales generated.
In table t2, I selected only the region name with the maximum value attached
to that region for the sales amount.
Finally, I combined both the tables by using the max values from table 2 and
the region names as the filter to only get values from table 1 where each
region's maximum sales values were.
"""


#2
"""
For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were
placed?"""

WITH t1 AS (
    SELECT r.name region_name,
           SUM(o.total_amt_usd) total_amt_usd

     FROM region r
     JOIN sales_reps s
     ON r.id = s.region_id
     JOIN accounts a
     ON a.sales_rep_id = s.id
     JOIN orders o
     ON o.account_id = a.id
     GROUP BY 1
     ORDER BY 2 DESC
  ),

      t2 AS (
        SELECT MAX(total_amt_usd)
        FROM t1
      )

SELECT r.name region_name,
       COUNT(o.total) total_order

FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (select * from t2);


"""
# EXPLANATION

In Table t1, I got the names of regions as well as the total amount of sales that
were made in those region in ($).
In table t2 I got the maximum of the sales that were done in all the regions which
I used later as a sort of a test to filter things.
In the last SELECT statement, I used the region name and traced my way from there to
the orders table using the proper merging columns. Once at Orders I used the maximum
we got in t2 to get the region where the sum of sales match the value in t2
and use it to do counting.
"""
