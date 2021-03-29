LESSON 7
QUIZ : UNION
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


#1
"""
Write a query that uses UNION ALL on two instances (and selecting all columns) of the accounts table.
Then inspect the results and answer the subsequent quiz.
"""

SELECT *
    FROM accounts

UNION ALL

SELECT *
  FROM accounts




# Part 2
"""
Add a WHERE clause to each of the tables that you unioned in the query above, filtering the first table
where name equals Walmart and filtering the second table where name equals Disney. Inspect the results then
answer the subsequent quiz.

"""
SELECT *
    FROM accounts
    WHERE LOWER(accounts.name) = 'walmart'

UNION ALL

SELECT *
  FROM accounts
  WHERE LOWER(accounts.name) = 'disney';

# Part 3

"""
Perform the union in your first query in a common table expression and name it
double_accounts. Then do a COUNT the number of times a name appears in the double_accounts
table. If you do this correctly, your query results should have a count of 2 for each name.

"""

WITH double_accounts AS (

  SELECT *
      FROM accounts

  UNION ALL

  SELECT *
    FROM accounts

  )

SELECT name,
       COUNT(*) times_appeared

FROM double_accounts
GROUP BY 1
ORDER BY 2 DESC;
