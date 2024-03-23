import io
import pandas as pd

from datetime import date
from nselib import capital_market

if "data_loader" not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if "test" not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """

    # trade_date = "04-01-2023"
    trade_date = kwargs["execution_date"].strftime("%d-%m-%Y")
    # trade_date = (kwargs['execution_date'] - datetime.timedelta(days=3)).strftime("%d-%m-%Y")

    bce_df = pd.DataFrame()
    try:
        bce_df = capital_market.bhav_copy_equities(trade_date=trade_date)
    except KeyError:
        # print(f"No activity on {trade_date}")
        pass

    print(f"Shape of data: {bce_df.shape}")
    return bce_df


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, "The output is undefined"
