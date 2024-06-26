import re
import pandas as pd
import numpy as np


def toSnakeCase(col_name):

    col_name = col_name.replace('%','pct')

    col_name = (
        re.sub(r"(?<=[a-z])(?=[A-Z])|[^a-zA-Z]", " ", col_name).strip().replace(" ", "_")
    )
    # col_name = re.sub(r";+", ";",col_name)

    new_str = []
    l = len(col_name)
    
    ch = '_'

    for i in range(len(col_name)):
        if (col_name[i] == ch and i != (l-1) and
           i != 0 and col_name[i + 1] != ch and col_name[i-1] != ch):
            new_str.append(col_name[i])
             
        elif col_name[i] == ch:
            if ((i != (l-1) and col_name[i + 1] == ch) and
               (i != 0 and col_name[i-1] != ch)):
                new_str.append(col_name[i])
                 
        else:
            new_str.append(col_name[i])
         
    col_name =  ("".join(i for i in new_str))


    return "".join(col_name.lower())


def str_to_numeric(data, col, dtype):
    df_tmp = pd.DataFrame(data)
    # Replace non-numeric characters with an empty string
    df_tmp[col] = df_tmp[col].replace({"[^0-9.]": ""}, regex=True)
    # Replace remaining empty strings with NaN
    df_tmp[col] = df_tmp[col].replace({"": np.nan})
    # Convert the column to float
    df_tmp[col] = df_tmp[col].astype(dtype)

    return df_tmp[col]
