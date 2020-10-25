Link :https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/1d61769f-cde5-4f4a-b4db-e5c0de9b3285

#1
select a.name account_name,
	SUM(o._at) earliest_date
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_name
ORDER by account_name
ASC;

#2

SELECT a.name account_name,
	SUM(total_amt_usd) total_sales
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY account_name;

#3

SELECT w.occurred_at web_event,
       w.channel channel,
       a.name account_name
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY web_event
DESC LIMIT 1;

#4

SELECT w.channel channel,
 COUNT(w.channel) channel_times

 FROM web_events w
GROUP BY channel ;

#5
SELECT w.id web_event,
  w.occurred_at web_event_time,
  a.primary_poc primary_contact

FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY web_event_time
ASC LIMIT 1;


#6
SELECT a.name  account,
  MIN(o.total_amt_usd) total_usd

FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
ORDER BY total_usd ASC;

#7

SELECT r.name region,
  COUNT(s.id) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY region;
