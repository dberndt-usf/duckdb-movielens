-- demo2_explore.sql
-- Simple exploration queries

-- Sample of movies and ratings
SELECT * FROM movies LIMIT 5;
SELECT * FROM ratings LIMIT 5;

-- Distribution of ratings
SELECT rating, COUNT(*) AS num_ratings
FROM ratings
GROUP BY rating
ORDER BY rating;

-- Average rating per movieId
SELECT movieId, AVG(rating) AS avg_rating, COUNT(*) AS n
FROM ratings
GROUP BY movieId
ORDER BY avg_rating DESC
LIMIT 10;
