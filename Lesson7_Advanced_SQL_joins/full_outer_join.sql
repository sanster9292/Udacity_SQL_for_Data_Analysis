LESSON 7
QUIZ : Full Outer Join
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


#1
"""
Say you're an analyst at Parch & Posey and you want to see:

    * each account who has a sales rep and each sales rep that has an account (all of the columns in these returned rows will be full)
    * but also each account that does not have a sales rep and each sales rep that does not have an account (some of the columns in these returned rows will be empty)

"""

SELECT s.name sales_rep_name,
       a.name account_name

FROM sales_reps s
FULL JOIN accounts a 
ON s.id = a.sales_rep_id
ORDER BY 1;

"""
to isolate any unmatched rows we can add one more line at the end of the query.
"""

SELECT s.name sales_rep_name,
       a.name account_name

FROM sales_reps s
FULL JOIN accounts a
ON s.id = a.sales_rep_id
WHERE a.sales_rep_id IS NULL or s.id IS NULL
ORDER BY 1;
