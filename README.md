# nse-data-engineering

## Problem statement
The aim of this project is to build an end-to-end data pipeline for analysing National Stock Exchange (NSE) data.

This project tries to provide  a better understanding of the stock market to an average investor. ~~The data is distributed by individual stock names  to provide users with a comprehensive view of the market~~. The final output is a ~~Power BI~~ dashboard, consisting of two charts: a line chart showing day-to-day stock performance and a bar chart showing the top 5 sectors in the  market. ~~By analyzing the data in this way, the project aims to provide users with valuable insights that can help inform their investment decisions.~~

## Dataset

This project uses the nselib python package to fetch bhavcopy data.

#### What is bhavcopy?

A Bhavcopy (in a way, ticker tape in Indian context) is a daily snapshot of all the trades executed on the National Stock Exchange of India (NSE) . It provides detailed information on the trading activity of each security listed on the NSE, including stocks, bonds, derivatives, and other securities.

## Pre requisites

 * Python
 * Docker + Docker-compose
 * GCP project
 * Terraform

## Tools and Technologies used

 * Docker + Docker-compose - Used to maintain consistent versions across platforms/environments and define/share multi-containers

 * Terraform - Used to automate the deployment and management of infrastructure on Google Cloud Platform (GCP)

 * GCP - Used to store and process large amounts of data for the stock data analysis project. 
    * BigQuery is used as data-warehouse to store and query the stock data 
    * Google Cloud Storage is used as data lake to store the raw data before it is transformed

 * Mage - Used to orchestrate the ETL (extract, transform, load) pipeline for the stock data analysis project.

 * dbt - Used to transform the raw stock data into a format that is optimized for analysis. dbt is used to model the data and store it in BigQuery, allowing for efficient querying and analysis.

## Getting Started


[First Time Setup](https://github.com/Shivakumar-Guhesh/nse-data-engineering/blob/main/setup.md)

Build docker image

`docker compose build`

Start docker image

`docker compose up`

To access mage instance navigate to http://localhost:6789 in your browser

Run nse_equity_history pipeline in mage to load history data into postgres db

Coming soon:

Data loader pipeline using mage

Data transformations using dbt


(This project is the course-project of data-engineering-zoomcamp 2024)