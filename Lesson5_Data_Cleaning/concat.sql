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


#3
"""
We would also like to create an initial password, which they will change after their first log in.
The first password will be the first letter of the primary_poc's first name (lowercase), then the last
letter of their first name (lowercase), the first letter of their last name (lowercase), the last letter
of their last name (lowercase), the number of letters in their first name, the number of letters in their
last name, and then the name of the company they are working with, all capitalized with no spaces.
"""

WITH t1 as (
SELECT REPLACE(UPPER(name), ' ','') account_name,
	primary_poc full_name,
  REPLACE(LEFT(primary_poc,STRPOS(primary_poc, ' ')), ' ','') first_name,
  RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')) last_name

from accounts)

SELECT full_name ,
      account_name,
      CONCAT(LOWER(LEFT(first_name,1)), LOWER(RIGHT(first_name,1)), LOWER(LEFT(last_name,1)),
       LOWER(RIGHT(last_name,1)), LENGTH(first_name),LENGTH(last_name),account_name)
FROM t1;


"""
EXPLANATION:

Here I am just taking what we did in question 1 and 2 and bringing them together. There is nothing
to explain as I am just using right and left functions to get first and last letters and the lengths
and then just concatenate them. 

"""
