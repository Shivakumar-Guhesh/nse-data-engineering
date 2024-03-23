import re
import pandas as pd
import numpy as np


def toSnakeCase(string):
    string = (
        re.sub(r"(?<=[a-z])(?=[A-Z])|[^a-zA-Z]", " ", string).strip().replace(" ", "_")
    )
    return "".join(string.lower())


def str_to_numeric(data, col, dtype):
    df_tmp = pd.DataFrame(data)
    # Replace non-numeric characters with an empty string
    df_tmp[col] = df_tmp[col].replace({"[^0-9.]": ""}, regex=True)
    # Replace remaining empty strings with NaN
    df_tmp[col] = df_tmp[col].replace({"": np.nan})
    # Convert the column to float
    df_tmp[col] = df_tmp[col].astype(dtype)

    return df_tmp[col]
