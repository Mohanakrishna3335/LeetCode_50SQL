/*Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.*/
WITH prev AS (
  SELECT *,
         LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
         LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
  FROM Weather
)
SELECT id
FROM prev
WHERE DATEDIFF(DAY, prev_date, recordDate) = 1
  AND temperature > prev_temp;
