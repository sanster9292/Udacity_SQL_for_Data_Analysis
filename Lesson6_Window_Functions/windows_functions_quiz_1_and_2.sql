LESSON 6
QUIZ : Windows Functions quiz 1+2
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


Quiz # 1

"""
create another running total. This time, create a running total of standard_amt_usd (in the orders table)
over order time with no date truncation. Your final table should have two columns: one with the amount
being added for each new row, and a second with the running total.
"""
SELECT standard_amt_usd,
    SUM(standard_amt_usd)
    OVER (ORDER BY occurred_at)
FROM orders;


"""
EXPLANATION:

I am selecting the column of interest (standard_amt_usd) and then creating a running total of
that using the Window function OVER and ordering by the occurred_at columns to get the
output that we are looking for.

"""

Quiz # 2
"""
Now, modify your query from the previous quiz to include partitions. Still create a running total
of standard_amt_usd (in the orders table) over order time, but this time, date truncate occurred_at
by year and partition by that same year-truncated occurred_at variable. Your final table should have
three columns: One with the amount being added for each row, one for the truncated date, and a final
column with the running total within each year.
"""

SELECT standard_amt_usd,
    DATE_TRUNC('year', occurred_at) as year,
    SUM(standard_amt_usd) OVER
        (PARTITION BY (DATE_TRUNC('year', occurred_at)) ORDER BY occurred_at)
FROM orders;

"""
EXPLANATION:

Here I added to the query from quiz #1. I got the year of date from the occurred_at column.
Then I used that to partition the SUM being calculated. What this would do is create
groups based on the year of the transaction. The running total will then get reset
every time a new year starts up.
"""
