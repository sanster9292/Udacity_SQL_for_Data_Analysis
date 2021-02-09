


LESSON 3

EXERCISE : DISTINCT

#1

SELECT DISTINCT a.name account_name,
       r.region_name region_name
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN regions r
ON r.id = s.region_id;
