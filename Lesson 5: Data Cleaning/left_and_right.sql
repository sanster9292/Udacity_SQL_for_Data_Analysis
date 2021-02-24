CHAPTER 5
QUIZ : LEFT AND RIGHT
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


#1
"""
In the accounts table, there is a column holding the website for each company. The last three digits
specify what type of web address they are using. A list of extensions (and pricing) is provided here.
Pull these extensions and provide how many of each website type exist in the accounts table.
"""
SELECT	RIGHT(website, 3) domain_name,
		COUNT(*) count_domain
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

"""
EXPLANATION

To do this selected the website column from the accounts column then used the RIGHT function
with the argument of 3 to get the last three characters which are the domain name of the website.
I used the COUNT function to count how many times each domain appears.
Then I use the group fucntion to group it by the domain names and then order it by how the
highest count first
"""

#2
"""There is much debate about how much the name (or even the first letter of a company name) matters.
Use the accounts table to pull the first letter of each company name to see the distribution of company
names that begin with each letter (or number)."""


SELECT LEFT(LOWER(name),1) company_name,
		COUNT(*) count_domain
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

"""
EXPLANATION:

The work here is the same as the first question. I use the LEFT function to ge the first letter
from the left,then count how many times it occurs, group by the letter and then order by the count.
"""

#3
"""
Use the accounts table and a CASE statement to create two groups: one group of company names that
start with a number and a second group of those company names that start with a letter. What proportion
of company names start with a letter?

"""

SELECT SUM(num) nums , SUM(letter) letters
FROM(
  SELECT name,
        CASE WHEN LEFT(LOWER(name),1) in ('0','1','2','3','4','5','6','7','8','9')
            THEN 1 ELSE 0 END as num,
        CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
            THEN 0 ELSE 1 END AS letter
  FROM accounts) t1;


"""
EXPLANATION

This is the solution from the answers they gave and I don't understand
this query. 
"""
