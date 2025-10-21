-- demo5_explain.sql
-- Show query plan

EXPLAIN SELECT m.title, AVG(r.rating)
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUP BY m.title
ORDER BY AVG(r.rating) DESC
LIMIT 10;
