LESSON 6
QUIZ : Percentiles
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


#1
"""
Use the NTILE functionality to divide the accounts into 4 levels in terms of the amount of standard_qty
for their orders. Your resulting table should have the account_id, the occurred_at time for each order,
the total amount of standard_qty paper purchased, and one of four levels in a standard_quartile column.
"""


SELECT account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER split_accounts standard_quartile
FROM orders
WINDOW split_accounts AS (PARTITION BY account_id ORDER BY standard_qty)

"""
EXPLANATION

Here, I am simply selecting the appropriate columns and using Windows aliasing to
create windows based on account_id and then create quartiles for that account to
see how there orders are split.
Because I am using a window function the quartiles will reset with every new account id 
"""
