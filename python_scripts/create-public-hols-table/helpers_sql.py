from sqlalchemy import create_engine, text
import pyodbc
import requests
import pandas as pd
import numpy as np

# Note it was a pain in the butt to get the connection string right in SQL alchemy!!!
def save_to_db(df, db_name, table_name):
    """save a pandasdf as table in my SQLDEV instance. Need to update connection string if using any other db instance. Returns True if successful and False otherwise."""

    connection_string_sqlalchemy = (
        f"mssql+pyodbc://DESKTOP-JGNU8D2\\SQLDEV/{db_name}?"
        "driver=ODBC+Driver+17+for+SQL+Server&"
        "trusted_connection=yes&"
        "encrypt=yes&"
        "trustServerCertificate=yes"
    )
    
    # -----------
    # # for troubleshooting – connection string that I know works.
    # -----------
    # connection_string_sqlalchemy = (
    #     "mssql+pyodbc://DESKTOP-JGNU8D2\\SQLDEV/AdventureWorksDW?"
    #     "driver=ODBC+Driver+17+for+SQL+Server&"
    #     "trusted_connection=yes&"
    #     "encrypt=yes&"
    #     "trustServerCertificate=yes"
    # )
    # print(connection_string_sqlalchemy)
    # engine = create_engine(connection_string_sqlalchemy)
    
    # # TEST CONNECTION IF DESIRED
    # query = "SELECT TOP 10 * FROM Sales.Dim_Date"
    # test_df = pd.read_sql(query, engine)
    # print(test_df)

    engine = create_engine(connection_string_sqlalchemy)

    try:
        df.to_sql(table_name, con=engine, if_exists="replace", index=False)
        operation_successful = True
    except Exception as e:
        operation_successful = False
        print("An error occurred while writing to the database:", e)

    # Record the success status
    if operation_successful:
        print("db operation was successful.")
    else:
        print("db operation failed.")
    return operation_successful
