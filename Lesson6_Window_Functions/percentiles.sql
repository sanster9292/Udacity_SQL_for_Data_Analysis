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
       NTILE(4) OVER split_accounts AS standard_quartile
FROM orders
WINDOW split_accounts AS (PARTITION BY account_id ORDER BY standard_qty)
ORDER BY 1;

"""
EXPLANATION

Here, I am simply selecting the appropriate columns and using Windows aliasing to
create windows based on account_id and then create quartiles for that account to
see how there orders are split.
Because I am using a window function the quartiles will reset with every new account id
"""


#2

"""
Use the NTILE functionality to divide the accounts into two levels in terms of the amount of gloss_qty
for their orders. Your resulting table should have the account_id, the occurred_at time for each order,
the total amount of gloss_qty paper purchased, and one of two levels in a gloss_half column.

"""

SELECT account_id,
       occurred_at,
       gloss_qty,
       NTILE(2) OVER split_accounts AS gloss_half
FROM orders
WINDOW split_accounts AS (PARTITION BY account_id ORDER BY gloss_qty)
ORDER BY 1;

"""
EXPLANATION:

The logic is still the same, though I am just switching standard_qty with gloss_qty, everything else
stays the same.
"""

#3
"""
Use the NTILE functionality to divide the orders for each account into 100 levels in terms of the amount
of total_amt_usd for their orders. Your resulting table should have the account_id, the occurred_at time
for each order, the total amount of total_amt_usd paper purchased, and one of 100 levels in a total_percentile
column.
"""

SELECT account_id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER split_accounts AS total_percentile
FROM orders
WINDOW split_accounts AS (PARTITION BY account_id ORDER BY total_amt_usd)
ORDER BY 1;

"""
EXPLANATION:
Same logic but I am using the total_amt_usd to create percentiles (100 splits in the range)

"""
