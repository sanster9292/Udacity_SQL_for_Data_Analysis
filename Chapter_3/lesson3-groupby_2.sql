SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png


LESSON 3

EXERCISE
Questions: GROUP BY Part II

#1
SELECT a.name account_name,
	ROUND(AVG(o.standard_qty)) avg_standard_paper,
	ROUND(AVG(o.gloss_qty)) avg_gloss_paper,
    ROUND(AVG(o.poster_qty)) avg_poster_paper
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY account_name;



#2

SELECT a.name account_name,
	ROUND(AVG(o.standard_amt_usd),2) avg_spend_standard,
  ROUND(AVG(o.gloss_amt_usd),2) avg_spend_gloss,
  ROUND(AVG(o.poster_amt_usd),2) avg_spend_poster
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY account_name;


#3
SELECT s.name sales_rep_name,
       w.channel channel_name,
       count(*) num_events

FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;



# 4
SELECT r.name region_name,
       w.channel channel_name,
       count(*) num_events

FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;
