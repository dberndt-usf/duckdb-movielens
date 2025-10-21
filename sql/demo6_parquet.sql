-- demo6_parquet.sql
-- Demonstrate writing and reading Parquet files

-- 1. Export an existing table (ratings) to Parquet
COPY ratings TO 'parquet/ratings.parquet' (FORMAT PARQUET);

-- 2. Export a derived table (aggregated movie averages)
COPY (
    SELECT m.movieId,
           m.title,
           AVG(r.rating) AS avg_rating,
           COUNT(*) AS n
    FROM ratings r
    JOIN movies m ON r.movieId = m.movieId
    GROUP BY m.movieId, m.title
) TO 'parquet/movie_avg.parquet' (FORMAT PARQUET);

-- 3. Verify Parquet export by querying back
SELECT COUNT(*) AS rows_in_ratings_parquet
FROM read_parquet('parquet/ratings.parquet');

SELECT COUNT(*) AS rows_in_movie_avg_parquet
FROM read_parquet('parquet/movie_avg.parquet');

-- 4. Query directly from Parquet
SELECT *
FROM read_parquet('parquet/movie_avg.parquet')
ORDER BY avg_rating DESC
LIMIT 10;
