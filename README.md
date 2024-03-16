# nse-data-engineering

A data engineering project for analysing National Stock Exchange (India) data

This is developed as Course Project for data-engineering-zoomcamp 2024

## Getting Started
Install nselib to fetch 

Documentation: https://github.com/RuchiTanmay/nselib/tree/main

Note: Install tqdm for viewing for loop progress

Download a year's NSE's Bhavcopy data using nse_data_downloader.py

Usage: `python nse_data_downloader.py <year>`

Build docker image

`docker compose build`

Start docker image

`docker compose up`

To access mage instance navigate to http://localhost:6789 in your browser


Coming soon:

Data loader pipeline using mage

Data transformations using dbt