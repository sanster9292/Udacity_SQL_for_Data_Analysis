LESSON 6
QUIZ : Comparing to a previous row
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


#1
"""
In the previous video, Derek outlines how to compare a row to a previous or subsequent row. This technique
can be useful when analyzing time-based events. Imagine you're an analyst at Parch & Posey and you want to
determine how the current order's total revenue ("total" meaning from sales of all types of paper) compares
to the next order's total revenue.

Modify Derek's query from the previous video in the SQL Explorer below to perform this analysis. You'll
need to use occurred_at and total_amt_usd in the orders table along with LEAD to do so. In your query
results, there should be four columns: occurred_at, total_amt_usd, lead, and lead_difference.
"""


"""
Original query

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
       standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
SELECT account_id,
       SUM(standard_qty) AS standard_sum
  FROM orders
 GROUP BY 1
 ) sub
 """

 """
Modified query
 """

 SELECT occurred_at,
       total_amt_usd,
       LEAD(total_amt_usd) OVER (ORDER BY total_amt_usd) AS lead,
       LEAD(total_amt_usd) OVER (ORDER BY total_amt_usd) - total_amt_usd AS lead_difference
FROM (
SELECT account_id,
       occurred_at,
       SUM(total_amt_usd) AS total_amt_usd
  FROM orders
  GROUP BY 1,2
  ORDER BY 2
 ) sub


 """
EXPLANATION

Here, I took the account_id, occurred_at and sum all the total_amt_usd for each account to construct
the inner query. In the inner query i sorted it by the time the occurred_at columns to get a sense
of the time series nature of the data.

Once that query was constructed it was just a matter of getting the LEAD syntax right to calculate the
difference in amount between each consecutive transaction (which is why i ordered the inner query by
occurred_at. )
 """
