import pandas as pd
from datetime import date
from nselib import capital_market
from calendar import monthrange

# from time import time
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

BASE_DIR = f"./data/{year}"

if not os.path.exists(BASE_DIR):
    os.makedirs(BASE_DIR)


months = [x for x in range(1, 13)]

symbols = list(capital_market.equity_list()["SYMBOL"])


def yearly_bhav_data(year, month, dates):
    # bhav_df = pd.DataFrame()
    print(f"Downloading data for {month:02}-{year}")
    MONTH_DIR = f"{BASE_DIR}/{month:02}"
    if not os.path.exists(MONTH_DIR):
        os.makedirs(MONTH_DIR)
    for trade_date in tqdm(dates):
        try:
            # print(f"Processing for trade_date:{trade_date} ")
            # date_start = time()
            temp_df = capital_market.bhav_copy_with_delivery(trade_date=trade_date)
            # bhav_df = pd.concat([bhav_df, temp_df], ignore_index=True)
            # date_end = time()
            # print(f"Took %.3f second for {trade_date}" % (date_end - date_start))

            temp_df.to_csv(f"{MONTH_DIR}/bhavdata_{trade_date}.csv")
        except KeyError:
            # print(f"No activity on {trade_date}")
            pass
    print(f"Completed processing {month:02}-{year}")
    # print(bhav_df.shape)


def yearly_price_volume_and_deliverable_position_data(year, month, dates):
    price_volume_and_deliverable_position_df = pd.DataFrame()
    for i in range(len(dates) - 1):
        from_date = dates[i]
        to_date = dates[i + 1]
        for symbol in symbols:
            try:
                # date_start = time()
                temp_df = capital_market.price_volume_and_deliverable_position_data(
                    symbol=symbol, from_date=from_date, to_date=to_date
                )
                price_volume_and_deliverable_position_df = pd.concat(
                    [price_volume_and_deliverable_position_df, temp_df],
                    ignore_index=True,
                )
                # date_end = time()
                print(
                    # f"Took %.3f second for {symbol} from {from_date} to {to_date}"
                    # % (date_end - date_start)
                )
            except KeyError:
                print(f"No activity for {symbol} from {from_date} to {to_date}")
    price_volume_and_deliverable_position_df.to_csv(
        f".{BASE_DIR}/price_volume_and_deliverable_position_df_full_data_{month}.csv"
    )

    print(price_volume_and_deliverable_position_df.shape)


for month in months:
    # month_start = time()
    num_days = monthrange(year, month)[1]
    sdate = date(year=2023, month=month, day=1)  # start date
    edate = date(year=2023, month=month, day=num_days)  # end date
    dates = pd.date_range(sdate, edate, freq="d").strftime("%d-%m-%Y").tolist()
    yearly_bhav_data(year, month, dates)
    # yearly_price_volume_and_deliverable_position_data(
    # year=year, month=month, dates=dates
    # )
    # month_end = time()
    # print(f"Took %.3f second for {month}" % (month_end - month_start))
print(f"Print complete for {year}")
