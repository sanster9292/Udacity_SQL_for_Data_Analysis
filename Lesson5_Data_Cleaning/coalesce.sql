CHAPTER 5
QUIZ: COALESCE
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png

"""
There are some questions in this quiz that don't need SQL queries to answer
so I won't be putting them here .
"""

#1
"""
Run the query entered below in the SQL workspace to notice the row with missing
data.

This query was given to start with and the other questions will build on this.
"""
SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;


# 2
"""
Use COALESCE to fill in the accounts.id column with the accont.id for the NULL
value for the table in question 1

"""

SELECT COALESCE(a.id, a.id) filled_id,
        a.name, a.website, a.lat, a.long,
        a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

"""
EXPLANATION:
This is a poorly worded question as it isn't immediately clear what to do here.
I had to look at the solution to get an idea of what was being asked and I am still
not clear what it means so this SQL query is from the solution.

"""

#3
"""
Use COALESCE to fill in the orders.account_id column with the account.id for the
NULL value for the table in 1.
"""

SELECT COALESCE(a.id, a.id) filled_id,
       a.name, a.website, a.primary_poc, a.sales_rep_id,
       COALESCE(o.account_id, a.id) filled_order_id,
       o.occurred_at, o.standard_qty,  o.standard_amt_usd,
       o.poster_qty, o.poster_amt_usd,
       o.gloss_qty,o.gloss_amt_usd,
       o.total,  o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total is NULL;


"""
EXPLANATION:
I am selecting the columns which seem the most relevant to me. I am using
COALESCE to replace the NULL values in account.id as well orders.account_id
with the account id from the account table.
"""

#4
"""
Use COALESCE to fill in each of the qty and usd columns with 0 for the table in 1
"""

SELECT COALESCE(a.id, a.id) filled_id,
       a.name, a.website, a.primary_poc, a.sales_rep_id,
       COALESCE(o.account_id, a.id) filled_order_id,
       o.occurred_at,
       COALESCE(o.standard_qty,0) standard_qty,
       COALESCE(o.standard_amt_usd,0) standard_amt_usd,
       COALESCE(o.poster_qty,0) poster_qty,
       COALESCE(o.poster_amt_usd,0) poster_amt_usd,
       COALESCE(o.gloss_qty,0) gloss_qty,
       COALESCE(o.gloss_amt_usd,0) gloss_amt_usd,
       o.total,  o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total is NULL;

"""
EXPLANATION:
I am replacing each NULL value in the columns that deal with qty and usd with 0.
I am using COALESCE to do this and then giving these columns aliases to keep
track of what I am doing.
"""


#5
"""
Run the query in 1 where the WHERE removed and COUNT the number of ids.
"""
SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id


"""
EXPLANATION:
Simple count operation

"""

#6
"""
Run the query in 5, but with the COALESCE function used in questions 2 through 4
"""
SELECT COALESCE(a.id, a.id) filled_id,
       a.name, a.website, a.primary_poc, a.sales_rep_id,
       COALESCE(o.account_id, a.id) filled_order_id,
       o.occurred_at,
       COALESCE(o.standard_qty,0) standard_qty,
       COALESCE(o.standard_amt_usd,0) standard_amt_usd,
       COALESCE(o.poster_qty,0) poster_qty,
       COALESCE(o.poster_amt_usd,0) poster_amt_usd,
       COALESCE(o.gloss_qty,0) gloss_qty,
       COALESCE(o.gloss_amt_usd,0) gloss_amt_usd,
       o.total,  o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

"""
EXPLANATION:
What this question is asking that we run the COALESCE functions we wrote and use
them to show what the final table will look like where the NULLs have been
taken care of. 

"""
