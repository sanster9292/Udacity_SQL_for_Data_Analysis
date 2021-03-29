LESSON 7
QUIZ : Self JOINS
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png



#1
"""

Modify the query from the previous video, which is pre-populated in the SQL Explorer below,
to perform the same interval analysis except for the web_events table. Also:

  1. Change the interval to 1 day to find those web events that occurred after,
      but not more than 1 day after, another web event.
  2. Add a column for the channel variable in both instances of the table in your query

"""


"""ORIGINAL QUERY

SELECT o1.id AS o1_id,
       o1.account_id AS o1_account_id,
       o1.occurred_at AS o1_occurred_at,
       o2.id AS o2_id,
       o2.account_id AS o2_account_id,
       o2.occurred_at AS o2_occurred_at
  FROM orders o1
 LEFT JOIN orders o2
   ON o1.account_id = o2.account_id
  AND o2.occurred_at > o1.occurred_at
  AND o2.occurred_at <= o1.occurred_at + INTERVAL '28 days'
ORDER BY o1.account_id, o1.occurred_at

"""

# MODIFIED QUERY

SELECT w1.id AS w1_id,
       w1.account_id AS w1_account_id,
       w1.occurred_at AS w_occurred_at,
       w1.channel AS w1_channel,
       w2.id AS w2_id,
       w2.account_id AS w2_account_id,
       w2.occurred_at AS w2_occurred_at,
       w2.channel AS w2_channel
  FROM web_events w1
 LEFT JOIN web_events w2
   ON w1.account_id = w2.account_id
  AND w2.occurred_at > w1.occurred_at
  AND w2.occurred_at <= w1.occurred_at + INTERVAL '1 days'
ORDER BY w1.account_id, w1.occurred_at


"""
EXPLANATION

In this edited query we are taking the account id as the joining column and joining
the web_events table on itself.
By setting the INTERVAL to 1 days after the first event we can see which accounts
had 2 web events in a row. 

"""
