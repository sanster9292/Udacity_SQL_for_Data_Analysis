LESSON 5
Quiz: CONCAT
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


#1
"""

Each company in the accounts table wants to create an email address for each primary_poc. The email
address should be the first name of the primary_poc . last name primary_poc @ company name .com
"""

WITH t1 as (
  SELECT LOWER(name) account_name,
         primary_poc full_name,
         LEFT(primary_poc,STRPOS(primary_poc, ' ')) first_name,
         RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')) last_name

  FROM accounts)

SELECT first_name, last_name,
      CONCAT(LOWER(first_name),'.',LOWER(last_name),'@',LOWER(account_name),'.com')
FROM t1;


"""
EXPLANATION:

Here I created a temporary table 't1' where i got out all the things that I need
from the accounts table. I got the account name, the primary poc and then split the
full name of the primary_poc into first and last name by splitting on the space character.

Then I simply just concatenated the columns from this temporary table to create the
required email addresses.

"""


#2
"""
You may have noticed that in the previous solution some of the company names include spaces,
which will certainly not work in an email address. See if you can create an email address that
will work by removing all of the spaces in the account name, but otherwise your solution should be
just as in question 1.
"""

with t1 as (
  SELECT REPLACE(LOWER(name), ' ','') account_name,
           primary_poc full_name,
           LEFT(primary_poc,STRPOS(primary_poc, ' ')) first_name,
           RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')) last_name
  FROM accounts
)
SELECT first_name, last_name,
      CONCAT(LOWER(first_name),'.',LOWER(last_name),'@',LOWER(account_name),'.com')
FROM t1;

"""
EXPLANATION:

The reasoning is the same as question 1. The only thing tat I did different here
is that when I converted the name of the account to all lowercase, I also used the
REPLACE function to replace the space in the account name column.

"""
