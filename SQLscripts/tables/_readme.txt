Note I should have created a set of staging tables (i.e. copies of the adventure works OLTP database) to use as the source for loading into the data warehouse. However I just loaded straight from the "production" OLTP database.

See the SSIS version of this project for a better approach (that actually does load from staging tables)