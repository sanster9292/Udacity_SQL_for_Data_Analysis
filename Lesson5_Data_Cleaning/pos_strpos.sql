LESSON 5
Quiz: POSITION, STRPOS, & SUBSTR - AME DATA AS QUIZ 1
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png

# 1
"""
Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
"""

SELECT primary_poc AS contact_name,
     LEFT(primary_poc, STRPOS(primary_poc, ' ')) first_name,
	   RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')) last_name
FROM accounts;


"""
EXPLANATION:

The names in the primary_poc are separated by a space characters. So I start out by finding the
position where that space character using the STRPOS function.
Then I use the LEFT and RIGHT function to separate the name string based on the appearence of the
space character from teh left and right.

"""


#2
"""

Now see if you can do the same thing for every rep name in the sales_reps table.
Again provide first and last name columns.

"""

SELECT name sales_rep_name,
       LEFT(name, STRPOS(name, ' ')) first_name,
       RIGHT(name, LENGTH(name)-STRPOS(name, ' ')) last_name

FROM sales_reps;


"""
EXPLANATION :

Same reasoning as question 1


"""
