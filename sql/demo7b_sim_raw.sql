-- demo7_sim_raw.sql
-- Movie-to-movie cosine similarity using raw (non-centered) ratings

WITH pairs AS (
  SELECT a.movieId AS movie_a,
         b.movieId AS movie_b,
         SUM(a.rating * b.rating) AS dot,
         SQRT(SUM(a.rating * a.rating)) AS norm_a,
         SQRT(SUM(b.rating * b.rating)) AS norm_b
  FROM ratings a
  JOIN ratings b
    ON a.userId = b.userId AND a.movieId < b.movieId
  GROUP BY a.movieId, b.movieId
)
SELECT
  m1.title AS movie_a,
  m2.title AS movie_b,
  dot / NULLIF(norm_a * norm_b, 0) AS cosine_sim
FROM pairs
JOIN movies m1 ON pairs.movie_a = m1.movieId
JOIN movies m2 ON pairs.movie_b = m2.movieId
WHERE norm_a > 0 AND norm_b > 0
ORDER BY cosine_sim DESC
LIMIT 20;
