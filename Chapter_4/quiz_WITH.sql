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


#4
"""
For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd,
how many web_events did they have for each channel?
"""
WITH t1 AS (
  SELECT
          a.id account_id,
          a.name account_name,
          SUM(o.total_amt_usd) total_amt_spent

  FROM accounts a
  JOIN orders o
  ON a.id = o.account_id
  GROUP by 1,2
  ORDER BY SUM(o.total_amt_usd) DESC
  LIMIT 1
)

SELECT a.name account_name,
       w.channel channel_name,
       COUNT(*) event_counter

FROM accounts a
JOIN web_events w
ON a.id = w.account_id
AND a.id = (SELECT account_id from t1)
GROUP BY 1,2
ORDER BY 3 DESC;

"""
EXPLANATION

In this task we are doing two things
1. Getting the customer who spent the most amount of money throughout their lifetime as a customer.
2. Once we have accomplished #1, we use that customer's information to see how many events they
   held in each of the channels offered in the web_events table.

In subqery mania exercise this was done by subquerying and there were 2 nested subqueries which were
hard to follow. So, here we start out by creating a table where we are stringing together the
accounts and orders tables on their ids. We then sort the table based on the total amount
spent by each user and get the top spender that way.

Once we have the top spender we are going to pull the account name, channel name and merge
tables accounts, web_events and the table t1. WE are going to merge them on account_id being
the primary key for accounts table and foreign key for the other two tables. Once these are joined
together we will use COUNT(*) to count the occurence of each of the channels for the account we
found.  We, then group the table based on account name and channel type.

"""

#5
"""What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending
 accounts?"""

 WITH t1 as (
   SELECT a.id account_id,
   a.name account_name,
   SUM(o.total_amt_usd) total_amt_spent

   FROM accounts a
   JOIN orders o
   ON o.account_id = a.id
   GROUP BY 1,2
   ORDER BY 3 DESC
   LIMIT 10

 )


SELECT ROUND(AVG(total_amt_spent),2)
FROM t1;


"""
EXPLANATION:
In this task we are going to do 2 things:
1. We are going to figure out who are the top 10 spending accounts that we have in our database
   in terms of total amount spent over the lifetime of their account.
2. Get the average amount they spent.

We answer the first question by creating a table using the WITH clause. We create a table
by joining the accounts and orders tables on the account id as the Primary key for the accounts table
and the foreign key for the orders table. Once merged, we Group this table by the account id
and the account name and then order by the total amount spent to get the top 10 spenders.

Then we just take the average of the sum value that we created in step 1.
"""


#6
"""
What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that
spent more per order, on average, than the average of all orders.
"""

WITH t1 AS (
    SELECT AVG(o.total_amt_usd) avg_all
    FROM orders o
    JOIN accounts a
    ON a.id = o.account_id

),

  t2 AS (
    SELECT o.account_id,
          AVG(o.total_amt_usd) avg_more
    FROM orders o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT * FROM t1)
  )

SELECT AVG(avg_more)
FROM t2;

"""
EXPLANATION:
Here we are doing a simple task.

We need to find the average amount spent by the customers in the database. We then use this
to filter out the orders table to contain only the accounts that had averages above than the
average we calculted and the we just take the average of those accounts. 

"""
