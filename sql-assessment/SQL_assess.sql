-----Q1-----

SELECT 
   DATE(date) AS date_without_time, 
   SUM(impressions) AS total_impressions 
FROM 
   `linear-potion-369716.SQL_test.marketing_perf` 
GROUP BY 
   DATE(date);



-----Q2-----

SELECT 
   state, 
   SUM(revenue) AS total_revenue
FROM 
   `linear-potion-369716.SQL_test.website_rev` 
GROUP BY 
   state
ORDER BY 
   total_revenue DESC
LIMIT 
   3;



-----Q3-----

SELECT 
    name AS campaign_name,
    SUM(cost) AS total_cost,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(revenue) AS total_revenue
FROM 
    `linear-potion-369716.SQL_test.campain_info`
LEFT JOIN
    `linear-potion-369716.SQL_test.marketing_perf` AS marketing_perf
ON
    id = campaign_id
LEFT JOIN
    `linear-potion-369716.SQL_test.website_rev` AS website_rev
ON
    id = website_rev.campaign_id
GROUP BY
    name;




-----Q4-----

SELECT 
    state,
    SUM(conversions) AS total_conversions
FROM 
    `linear-potion-369716.SQL_test.campain_info`
LEFT JOIN
    `linear-potion-369716.SQL_test.marketing_perf` AS marketing_perf
ON
    id = campaign_id
LEFT JOIN
    `linear-potion-369716.SQL_test.website_rev` AS website_rev
ON
    id = website_rev.campaign_id
WHERE 
    name = 'Campaign5'
GROUP BY
    state
ORDER BY
    total_conversions DESC;


GA generated the most.



-----Q5-----

If by most efficient, we mean most profit, then the Campaign3 is ahead of everybody. 2nd would be Campaign4.




-----Q6-----

WITH DayOfWeekStats AS (
  SELECT
    EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
    AVG(impressions) AS avg_impressions,
    AVG(clicks) AS avg_clicks,
    AVG(conversions) AS avg_conversions
  FROM
    `linear-potion-369716.SQL_test.marketing_perf` 
  GROUP BY
    day_of_week
)

SELECT
  CASE
    WHEN day_of_week = 1 THEN 'Sunday'
    WHEN day_of_week = 2 THEN 'Monday'
    WHEN day_of_week = 3 THEN 'Tuesday'
    WHEN day_of_week = 4 THEN 'Wednesday'
    WHEN day_of_week = 5 THEN 'Thursday'
    WHEN day_of_week = 6 THEN 'Friday'
    WHEN day_of_week = 7 THEN 'Saturday'
    ELSE 'Unknown'
  END AS day_name,
  avg_impressions,
  avg_clicks,
  avg_conversions
FROM
  DayOfWeekStats
ORDER BY
  avg_conversions DESC;


Wednesdays and Fridays are the best days.

Saturdays and Sundays are the worst.
