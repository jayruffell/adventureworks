# %%
from sqlalchemy import create_engine, text
import pyodbc
import requests
import pandas as pd
import numpy as np
import helpers as hp # cant run interactively for some reason.


# %%
from sqlalchemy import create_engine, text

# Valid SQLAlchemy connection string using pyodbc. Pain in the butt to get this right!
connection_string_sqlalchemy = (
    "mssql+pyodbc://DESKTOP-JGNU8D2\\SQLDEV/AdventureWorksDW?"
    "driver=ODBC+Driver+17+for+SQL+Server&"
    "trusted_connection=yes&"
    "encrypt=yes&"
    "trustServerCertificate=yes"
)
engine = create_engine(connection_string_sqlalchemy)
query = "SELECT TOP 10 * FROM Sales.Dim_Date"
df = pd.read_sql(query, engine)
df.to_sql('Sales.Dim_Date', con=engine, if_exists='append', index=False)
print(df)
