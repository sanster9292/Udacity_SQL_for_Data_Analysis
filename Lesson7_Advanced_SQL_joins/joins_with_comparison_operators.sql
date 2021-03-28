LESSON 7
QUIZ : Inequality joins
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png




#1
"""
write a query that left joins the accounts table and the sales_reps tables on each sale rep's ID number and joins
it using the < comparison operator on accounts.primary_poc and sales_reps.name, like so:

accounts.primary_poc < sales_reps.name.

The query results should be a table with three columns: the account name (e.g. Johnson Controls), the primary contact name
(e.g. Cammy Sosnowski), and the sales representative's name (e.g. Samuel Racine)


"""
SELECT a.name account_name,
       a.primary_poc primary_poc,
       s.name sales_rep_name
FROM accounts a
LEFT JOIN sales_reps s
ON s.id = a.sales_rep_id
WHERE a.primary_poc < s.name
ORDER BY 1;

"""
Explanation

The question statement is simple I am selecting the account name, the primary_poc name and the sales_rep_name
and then then joining them where primary_poc is less than sales_rep_name. What this does is it sees how the
names of the primary_poc compares with the sales_rep_name. So if the primary_poc name was "Alvin Smith" and
the sales_rep_name was "Ben Baker" it would meet our filtering requirement. 


"""
