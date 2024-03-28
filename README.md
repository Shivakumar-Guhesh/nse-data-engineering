# nse-data-engineering

## Problem statement  
The aim of this project is to build an end-to-end data pipeline (including a dashboard) for analysing and visualizing National Stock Exchange (NSE) data.

What the problem the project solves?

This project provides a simple dashboard for viewing trends and insights of NSE on a daily basis.

## Dataset

This project uses the nselib python package to fetch bhavcopy data.

#### What is bhavcopy?

> Bhavcopy (ticker tape in Indian context) is a daily snapshot of all the trades executed on the National Stock Exchange of India (NSE) . 

## Pre requisites

 * Python
 * Docker + Docker-compose
 * GCP
 * Terraform
 * DBT developer project

## Tools and Technologies used

 * Docker + Docker-compose - Used to maintain consistent versions across environments and define/share multi-containers
 
 * Mage - Used to create and orchestrate the ETL (extract, transform, load) pipelines for the stock data analysis project.

 * Terraform - Used to automate the deployment and management of infrastructure on Google Cloud Platform (GCP)

 * GCP 
    * BigQuery is used as data-warehouse to store and query the stock data 

    * Google Cloud Storage is used as data lake to store the raw data before it is transformed

    * Cloud Run is used for running deployed Mage pipelines on cloud

 * dbt - Used to transform the raw stock data to make it more suitable for analysis.

## Getting Started

[First Time Setup](https://github.com/Shivakumar-Guhesh/nse-data-engineering/blob/main/setup.md)

Build docker image

`docker compose build`

Start docker image

`docker compose up`

To access mage instance navigate to http://localhost:6789 in your browser

Data loader pipeline using mage

Data transformations using dbt


(This project is the course-project of data-engineering-zoomcamp 2024)