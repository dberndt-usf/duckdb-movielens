# DuckDB MovieLens Analytics Module

This repository demonstrates how to use **DuckDB** for analytical SQL and recommender system examples using the **MovieLens 100K** dataset.

It is organized as a progressive teaching module suitable for data management, data warehousing, and recommender systems courses.

---

## 🧭 Project Overview

**Key Concepts Demonstrated**
- In-process analytics with DuckDB
- Loading and exploring CSV data
- SQL joins, aggregates, and window functions
- Query plans and performance inspection
- Exporting and querying Parquet data
- Movie similarity (cosine similarity) analysis

**Structure**
```
duckdb-movielens/
├── data/          # raw MovieLens CSVs (version-locked)
├── parquet/       # generated Parquet outputs
├── sql/           # stepwise demo SQL scripts
├── scripts/       # Python or notebook demos
├── movielens.duckdb  # local DuckDB database (not tracked)
└── README.md
```

---

## ⚙️ Environment Setup

Each user should create their own local Python virtual environment (the `.venv-ddb` folder is not included in the repository).

```bash
# Clone and enter the project
git clone https://github.com/YOUR-USERNAME/duckdb-movielens.git
cd duckdb-movielens

# Create and activate a local virtual environment
python3 -m venv .venv-ddb
source .venv-ddb/bin/activate

# Install required packages
pip install duckdb pandas matplotlib
# or, if a requirements file is provided
# pip install -r requirements.txt
```

If you already maintain a shared environment named `.venv-ddb` (used across multiple projects), you can simply activate it instead of creating a new one:

```bash
source ~/.venv-ddb/bin/activate
```
---

## 📂 Data

The `data/` folder contains a fixed version of the **MovieLens 100K (Small)** dataset.

> **Note:**  
> These CSVs are *version-locked for reproducibility*.  
> They should not be modified. See tags for dataset versions:
> ```bash
> git tag -l
> ```

If needed, you can regenerate the dataset manually:
```bash
wget https://files.grouplens.org/datasets/movielens/ml-latest-small.zip
unzip ml-latest-small.zip -d data/
```

---

## 🧱 SQL Demos

Each demo script illustrates a concept and can be run directly from the command line:

```bash
duckdb movielens.duckdb -init sql/demo1_load.sql
```

| Demo | Topic | Highlights |
|------|--------|------------|
| demo1_load | Load CSVs | Create tables and verify counts |
| demo2_explore | Data exploration | Aggregations, distributions |
| demo3_join | Joins | Combine ratings and movie titles |
| demo4_window | Window functions | User-level averages |
| demo5_explain | Query plans | `EXPLAIN` and optimization |
| demo6_parquet | Parquet export/query | Write & read Parquet files |
| demo7a_sim_centered | Analytical SQL | Cosine similarity on centerd ratings |
| demo7b_sim_raw | Analytical SQL | Cosine similarity on raw ratings |

To run all demos in sequence:
```bash
for f in sql/demo*.sql; do
  echo "Running $f ..."
  duckdb movielens.duckdb -init "$f"
done
```

---

## 🧩 Parquet Outputs

The `/parquet/` directory stores generated Parquet exports from `demo6_parquet.sql`.  
These are ignored by Git and can be recreated at any time.

Example verification query:
```sql
SELECT COUNT(*) FROM read_parquet('parquet/movie_avg.parquet');
```

---

## 🔒 Version Locking

Dataset CSVs are committed once and marked as unchanged to preserve reproducibility:

```bash
git update-index --assume-unchanged data/*.csv
git tag v1.0-data
```

To unlock:
```bash
git update-index --no-assume-unchanged data/*.csv
```

---

## 🚀 Next Steps

- Add Python scripts or notebooks under `/scripts/` to visualize results.  
- Integrate with **MinIO** for S3-style Parquet access.  
- Extend the cosine similarity demo into a full recommender notebook.

---

**Author:** Don Berndt  
**Muma College of Business, University of South Florida**
