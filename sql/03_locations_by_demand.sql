SELECT location,
       COUNT(*)                    AS restaurants,
       ROUND(AVG(rating), 2)       AS avg_rating,
       ROUND(AVG(votes), 0)        AS avg_votes,
       ROUND(AVG(cost_for_two), 0) AS avg_cost
FROM restaurants
GROUP BY location
HAVING COUNT(*) >= 30
ORDER BY avg_votes DESC
LIMIT 15;