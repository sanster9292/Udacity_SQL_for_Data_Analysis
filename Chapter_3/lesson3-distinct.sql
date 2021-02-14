


LESSON 3

EXERCISE : DISTINCT
SQL SCHEMATIC : https://sanwal-bucket-01.s3.amazonaws.com/screen-shot-2017-11-16-at-3.54.06-pm.png

#1

SELECT DISTINCT a.name account_name,
       r.region_name region_name
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN regions r
ON r.id = s.region_id;
SQL SCHEMATIC : https://s3.console.aws.amazon.com/s3/upload/sanwal-bucket-01?region=us-east-1
