import pandas as pd
from datetime import date
from nselib import capital_market
from calendar import monthrange
import argparse
import os
from tqdm import tqdm

parser = argparse.ArgumentParser(
    description="Downloads NSE bhav_data and saves it in csv file."
)
parser.add_argument("year", metavar="y", type=int, help="data's year")


args = vars(parser.parse_args())
year = args["year"]
print(f"Processing for year {year}")

BASE_DIR = f"../data/{year}"

if not os.path.exists(BASE_DIR):
    os.makedirs(BASE_DIR)


months = [x for x in range(1, 13)]

symbols = list(capital_market.equity_list()["SYMBOL"])


def yearly_bhav_data(year, month, dates):
    """
    Takes year, month and dates as arguments and downloads
    bhav_copy_with_delivery data from nselib for the given dates
    and saves it in a csv file for each date.

    Args:
        year : integer
        month : integer
        dates : list of dates with each date in the format '%d-%m-%Y'

    """
    print(f"Downloading data for {month:02}-{year}")
    MONTH_DIR = f"{BASE_DIR}/{month:02}"
    if not os.path.exists(MONTH_DIR):
        os.makedirs(MONTH_DIR)
    for trade_date in tqdm(dates):
        try:
            temp_df = capital_market.bhav_copy_with_delivery(trade_date=trade_date)
            temp_df.to_csv(f"{MONTH_DIR}/bhavdata_{trade_date}.csv", index=False)
        except KeyError:
            # print(f"No activity on {trade_date}")
            pass
    print(f"Completed downloading data for {month:02}-{year}")


for month in months:
    num_days = monthrange(year, month)[1]
    sdate = date(year=year, month=month, day=1)  # start date
    edate = date(year=year, month=month, day=num_days)  # end date
    dates = pd.date_range(sdate, edate, freq="d").strftime("%d-%m-%Y").tolist()
    yearly_bhav_data(year, month, dates)


print(f"Download complete for {year}")
