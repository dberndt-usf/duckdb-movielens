-- demo8_persist.sql
-- Create and load MovieLens tables
-- into a persistent database file.
-- Start up as "duckdb movielens100k.duckdb"
-- to enable persistence using a file.

-- Check if there are any files.
.tables

-- Create and load MovieLens tables.
CREATE OR REPLACE TABLE movies AS
SELECT * FROM read_csv_auto('data/movies.csv');

CREATE OR REPLACE TABLE ratings AS
SELECT * FROM read_csv_auto('data/ratings.csv');

CREATE OR REPLACE TABLE tags AS
SELECT * FROM read_csv_auto('data/tags.csv');

CREATE OR REPLACE TABLE links AS
SELECT * FROM read_csv_auto('data/links.csv');

-- Verify the tables exist.
.tables

-- Exit and restart to check on persistence.
.exit
