SELECT
    CASE
        WHEN cost_for_two <= 300  THEN 'Budget (up to 300)'
        WHEN cost_for_two <= 600  THEN 'Mid (301-600)'
        WHEN cost_for_two <= 1000 THEN 'Upper-mid (601-1000)'
        ELSE 'Premium (1000+)'
    END AS price_band,
    COUNT(*)                AS restaurants,
    COUNT(rating)           AS rated_restaurants,
    ROUND(AVG(rating), 2)   AS avg_rating,
    ROUND(AVG(votes), 1)    AS avg_votes,
    SUM(votes)              AS total_votes
FROM restaurants
GROUP BY price_band
ORDER BY MIN(cost_for_two);