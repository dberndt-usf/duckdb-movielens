-- demo7_sim_centered.sql
-- Movie-to-movie cosine similarity using mean-centered ratings
-- Removes per-user bias to emphasize relative preference patterns

WITH centered AS (
  SELECT userId,
         movieId,
         rating - AVG(rating) OVER (PARTITION BY userId) AS centered_rating
  FROM ratings
),
pair_sums AS (
  SELECT a.movieId AS movie_a,
         b.movieId AS movie_b,
         SUM(a.centered_rating * b.centered_rating) AS dot,
         SQRT(SUM(a.centered_rating * a.centered_rating)) AS norm_a,
         SQRT(SUM(b.centered_rating * b.centered_rating)) AS norm_b
  FROM centered a
  JOIN centered b
    ON a.userId = b.userId AND a.movieId < b.movieId
  GROUP BY a.movieId, b.movieId
)
SELECT
  m1.title AS movie_a,
  m2.title AS movie_b,
  dot / NULLIF(norm_a * norm_b, 0) AS cosine_sim
FROM pair_sums
JOIN movies m1 ON pair_sums.movie_a = m1.movieId
JOIN movies m2 ON pair_sums.movie_b = m2.movieId
WHERE norm_a > 0 AND norm_b > 0
ORDER BY cosine_sim DESC
LIMIT 20;
