# Setup

## Python dependencies:

- Download attached requirements.txt file

- Run `pip install -r requirements.txt` to install all the necessary python packages.

  - nselib is used to fetch NSE data

  - tqdm for viewing for loop progress
  
## Docker

- Provide appropriate details in .env file


## Terraform

- Download and replace GCP service-account key files inside keys subfolder.

- Run `terraform init` to initialize terraform.

- Run `terraform plan` to view changes which would be applied.

- Run `terraform apply` to create all the necessary resources.

- Run `terraform destroy` to destroy all the resources created by terraform.


## Mage


- To build docker image

  `docker compose build`

- To start docker image

  `docker compose up`

- To access mage instance navigate to http://localhost:6789 in your browser

## DBT

- For Creating DBT project:

  - Create a new github repository, copy all the files inside `dbt_files` sub-directory.

  - Go to [dbt cloud](https://cloud.getdbt.com/)

  - Create a project. Give newly created repo info, data warehouse credentials

    *(Note: Only 1 project can be created at a time)*

  - Run `dbt build` to view models

Optional

Download a particular year's NSE's Bhavcopy data to local file system using nse_data_downloader.py

Usage: `python nse_data_downloader.py <year>`