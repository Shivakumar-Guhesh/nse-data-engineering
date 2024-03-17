import pandas as pd
from datetime import date
from calendar import monthrange
from urllib.error import HTTPError
from tqdm import tqdm


def load_data_from_api(*args, **kwargs):
    """
    Description of load_data_from_api

    Args:
        *args (undefined):
        **kwargs (undefined):

    """
    """
    Template for loading data from API
    """
    data = pd.DataFrame()

    base_url = "https://raw.githubusercontent.com/Shivakumar-Guhesh/nse-data-engineering/main/data/"
    file_pattern = "bhavdata"
    years = [2021]
    months = [x for x in range(1, 13)]
    for year in years:
        for month in tqdm(months, desc="Months: "):
            num_days = monthrange(year, month)[1]
            sdate = date(year=year, month=month, day=1)  # start date
            edate = date(year=year, month=month, day=num_days)  # end date
            dates = pd.date_range(sdate, edate, freq="d").strftime("%d-%m-%Y").tolist()
            for trade_date in tqdm(dates, desc="Dates: "):
                try:
                    file = f"{file_pattern}_{trade_date}"
                    url = f"{base_url}/{year}/{month:02}/{file}.csv"
                    df = pd.read_csv(url, sep=",")

                    data = pd.concat([data, df], ignore_index=True)
                except HTTPError as err:
                    if err.code == 404:
                        pass
                    else:
                        raise
    print(f"Shape of data: {data.shape}")
    return data


load_data_from_api()
