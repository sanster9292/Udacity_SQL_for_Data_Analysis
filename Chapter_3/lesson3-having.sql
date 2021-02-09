
LESSON 3

EXERCISE : HAVING


# 1

SELECT s.id sales_rep_id, s.name sales_rep_name,
       count(*) num_accounts
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
GROUP BY s.id , s.name
HAVING count(*) >=5
ORDER BY num_accounts ASC;


# 2

SELECT a.name Account_Name,
      o.account_id,
      count(*) total_orders

FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name, o.account_id
HAVING count(*) > 20
ORDER BY total_orders;

#3

SELECT a.id account_id,
       a.name account_name,
       COUNT(*) total_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_orders DESC LIMIT 1;

#4

SELECT a.id account_id,
       a.name account_name,
       SUM(o.total_amt_usd) total_amt_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_amt_usd DESC ;



#5

SELECT a.id account_id,
       a.name account_name,
       SUM(o.total_amt_usd) total_amt_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_amt_usd DESC ;


#6

SELECT a.id account_id,
       a.name account_name,
       SUM(o.total_amt_usd) total_amt_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_amt_usd DESC LIMIT 1;

#7
SELECT a.id account_id,
       a.name account_name,
       SUM(o.total_amt_usd) total_amt_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_amt_usd ASC LIMIT 1;


#8

SELECT a.id account_id,
       a.name account_name,
       count(*) facebook_used
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name , w.channel
HAVING count(*) >6 AND w.channel ='facebook'
ORDER BY facebook_used ASC;

#9

SELECT a.id account_id,
       a.name account_name,
       count(*) facebook_used
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name , w.channel
HAVING w.channel ='facebook'
ORDER BY facebook_used DESC LIMIT 1;


#10

SELECT a.id account_id,
       a.name account_name,
       w.channel channel_name,
       count(*) channel_used
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel;
