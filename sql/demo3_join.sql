-- demo3_join.sql
-- Join example

SELECT m.title, AVG(r.rating) AS avg_rating, COUNT(*) AS n
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUP BY m.title
HAVING n >= 50
ORDER BY avg_rating DESC
LIMIT 10;
