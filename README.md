# Analytics Engineering Project: Olist E-commerce

![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Athena](https://img.shields.io/badge/Amazon_Athena-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![S3](https://img.shields.io/badge/Amazon_S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)

## About the Project

This project consists of a complete **ELT (Extract, Load, Transform)** pipeline, developed to process and analyze data from the public dataset of **Olist (Brazilian E-commerce)**.
 
The main objective was to build a modern and scalable **Data Warehouse** in the cloud, using the AWS stack (S3, Glue, Athena) and orchestrating data transformations and quality with **dbt Core**.

### Architecture

The project follows the architecture of the **Modern Data Stack**:

1.  **Data Lake (Raw):** Ingestion of raw data (CSV) into Amazon S3.
2.  **Data Catalog:** Automatic cataloging of metadata via AWS Glue Crawler.
3.  **Data Warehouse (Processing):** Serverless processing using Amazon Athena.
4.  **Transformation Layer:** Data modeling and testing with dbt Core.

## Technology Stack

* **Language:** SQL, YAML, Python.
* **Orchestration & Transformation:** dbt Core.
* **Data Lakehouse:** AWS S3 + AWS Glue + Amazon Athena.
* **Data Quality:** dbt native tests + `dbt-expectations` package.
* **Documentation:** dbt docs.

## dbt Project Structure

Data modeling followed Analytics Engineering best practices:
* **Staging (`models/staging`):** * Initial cleaning of raw data.
* Standardization of data types (Casting).
* Renaming of columns (Snake Case).
    
* Materialization: *View*.
* **Marts (`models/marts`):** * Fact and Dimension tables (Star Schema).
* Complex business rules and joins.
* Aggregations and calculated metrics.
* Materialization: *Table* or *View*.

## Data Quality

Ensuring data integrity was a priority. In addition to dbt's native tests (`unique`, `not_null`), the **`dbt-expectations`** package was implemented for advanced validations:

* Temporal consistency validation (e.g., delivery date > order date).
* Format validation (e.g., 2-character state abbreviations).
* Referential integrity validation between tables.

## How to Execute the Project

### Requirements

* Python 3.10+ installed.
* AWS account with access to S3 and Athena.
* AWS CLI configured locally.

### Step by Step

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/joaovnovais/analytics-engineering-dbt-aws.git](https://github.com/joaovnovais/analytics-engineering-dbt-aws.git)
    cd analytics-engineering-dbt-aws
    ```
2.  **Create and activate a virtual environment:**
    ```bash
    python -m venv venv
    source venv/bin/activate  # Linux/Mac
    venv\Scripts\activate     # Windows
    ```

3.  **Install dependencies:**
    ```bash
    pip install dbt-core dbt-athena-community
    dbt deps
    ```

4.  **Configure the `profiles.yml`:**
    Configure your AWS credentials in the file `~/.dbt/profiles.yml`.

5.  **Execute the project:**
    ```bash
    dbt build
    ```

6.  **Generate documentation:**
    ```bash
    dbt docs generate
    dbt docs serve
    ```

    
