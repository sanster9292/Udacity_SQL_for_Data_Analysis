LESSON 6
QUIZ : Row number and rank
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


# 1
"""
Select the id, account_id, and total variable from the orders table, then create a column called
total_rank that ranks this total amount of paper ordered (from highest to lowest) for each account
using a partition. Your final table should have these four columns.
"""

SELECT id,
       account_id ,
       total,
       RANK() OVER(PARTITION BY account_id ORDER BY total DESC) AS total_rank

FROM orders;

"""
EXPLANATION:

Here, I selected the id, account_id and total to start with and then created a Window
using OVER and PARTITION to look at unique account_id to reset the RANK() for each
account_id and sort (within that window) based on the total of the order.
"""
