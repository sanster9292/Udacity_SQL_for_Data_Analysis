
LESSON 5 : CAST
No schema diagram was provided for this exercise

#1
"""
Write a query to look at the top 10 rows to understand the columns and the raw
data in the dataset called sf_crime_data
"""

SELECT *
FROM sf_crime_data
LIMIT 10;

#2
"""
Remembering back to the lesson on dates, use the Quiz Question at the bottom
of this page to make sure you remember the format that dates should use in SQL.
"""

The answer to this is yyyy-mm-dd


# 3

"""
Look at the date column in sf_crime_data table. Notice the date is not in the
correct format.
"""
Not an SQL query.
The entries are in dd/mm/yyyy:hr:mm:ss AM +0000
and this is indeed the wrong entry.

#4
"""
Write a query to change the date into the correct SQL date format. You will need
to use at least SUBSTR and CONCAT to perform this operation.

"""
SELECT DATE orig_date,
     CONCAT(SUBSTR(SUBSTR(DATE,6,7),2,4), '-',
            SUBSTR(DATE,1,2), '-',
            SUBSTR(SUBSTR(DATE,4,5),1,2)
          ) new_date
FROM sf_crime_data;

"""
EXPLANATION:
I am using SUBSTR to get the specific part of the string to get year as well as
month and day and then concatenating them together.
"""

#5
"""
Once you have created a new column in the correct format, use either CAST or ::
to convert this to a date.
"""
SELECT DATE orig_date,
     CONCAT(SUBSTR(SUBSTR(DATE,6,7),2,4), '-',
            SUBSTR(DATE,1,2), '-',
            SUBSTR(SUBSTR(DATE,4,5),1,2)
          )::DATE new_date
FROM sf_crime_data;

"""
EXPLANATION:

This is the same as query from #4 but I am using :: function to cast that column
as a date. 
"""
