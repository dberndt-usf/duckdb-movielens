-- demo1_load.sql
-- Run DuckDB as an in-memory database.
-- Invoke as "duckdb" with no file specified.

-- Create and load MovieLens tables.
CREATE OR REPLACE TABLE movies AS
SELECT * FROM read_csv_auto('data/movies.csv');

CREATE OR REPLACE TABLE ratings AS
SELECT * FROM read_csv_auto('data/ratings.csv');

CREATE OR REPLACE TABLE tags AS
SELECT * FROM read_csv_auto('data/tags.csv');

CREATE OR REPLACE TABLE links AS
SELECT * FROM read_csv_auto('data/links.csv');

-- Verify tables exist.
.tables

-- Run a couple queries.
SELECT COUNT(*) AS num_movies FROM movies;
SELECT COUNT(*) AS num_ratings FROM ratings;
