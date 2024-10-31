Purpose of this subproject:
1.	the parent directory contains my original attempt at creating an adventure works data warehouse. I largely followed the tutorial per the “parent” readme, but I also wanted to populate the tables using straight SQL scripts. So, the parent directory contains an approach where I break down each table into a “create” SQL script and a “load” SQL script. This approach worked fine, and I was able to create the database, create the tables, load the data, and connect a PBI to it.
2.	The purpose of this subproject is to *redo the loading* using SSIS - as is described in the tutorial per the “parent” readme. I didn’t want to undo the original attempt (loading with SQL scripts), I just want to create a copy of the database and tables and load using this different method.
3.	So, in this subproject my plan is to copy the create database/schema/table statements from the parent directory scripts, but use SSIS instead of the “load” scripts.

---------------
SSIS pipeline help
---------------

When I first opened a new SSIS integration services package in Visual Studio it popped up with some "getting started" links. Only skimmed through these, here they are below if I want more detailed understanding:

https://learn.microsoft.com/en-us/sql/integration-services/integration-services-tutorials?view=sql-server-ver16
https://learn.microsoft.com/en-us/sql/integration-services/data-flow/data-flow?view=sql-server-ver16
https://learn.microsoft.com/en-us/sql/integration-services/control-flow/control-flow?view=sql-server-ver16

