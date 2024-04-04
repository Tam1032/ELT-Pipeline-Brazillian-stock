# ETL-Pipeline-Brazillian-stock
This is a project for the course "Fundamental Data Engineering" (FDE) from AIDE Institute. 
This project implements a basic data pipeline ETL (Extract-Transform-Load), using the Brazillian stock market dataset from Kaggle. You can access the dataset [here](https://www.kaggle.com/datasets/leomauro/brazilian-stock-market-data-warehouse?select=factStocks.csv).
Dagster is used as a data orchestrator and it is combined with dbt to transform the data. Docker is used to initilize the environment and prepare the packages.

## Installation
You should first have Dagster, dbt, Docker installed on your computer. 
For PostgreSQL and MySQL, you can use them along with a database adminstration tool like Docker, which I used in this project.
## Run Dagster
You can run Dagster by using the following commands:\
``cd etl_pipeline`` \
``dagster dev -f dagster_dbt_assets.py``