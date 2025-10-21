-- demo4_window.sql
-- Demonstrate window analytics

SELECT userId,
       rating,
       AVG(rating) OVER (PARTITION BY userId) AS user_avg,
       rating - AVG(rating) OVER (PARTITION BY userId) AS diff
FROM ratings
LIMIT 10;
