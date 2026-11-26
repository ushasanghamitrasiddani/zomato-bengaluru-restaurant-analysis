SELECT location,
       CASE
           WHEN cost_for_two <= 300  THEN 'Budget (up to 300)'
           WHEN cost_for_two <= 600  THEN 'Mid (301-600)'
           WHEN cost_for_two <= 1000 THEN 'Upper-mid (601-1000)'
           ELSE 'Premium (1000+)'
       END AS price_band,
       COUNT(*)              AS restaurants,
       ROUND(AVG(rating), 2) AS avg_rating,
       ROUND(AVG(votes), 0)  AS avg_votes
FROM restaurants
GROUP BY location, price_band
HAVING COUNT(*) >= 15
ORDER BY avg_votes DESC
LIMIT 15;