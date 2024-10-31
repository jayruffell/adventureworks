this dir structure follows chatgpt best practice recommendations.

These files refer only to the adventure works data warehouse database - there is a single file for creating the  adventure works OLTP database inside the \AdventureWorks-oltp-install-script folder.

Update - it may have been simpler to have all scripts in the same folder (not broken down by databse, schema, views, tables etc.) - that way you can number the whole lot from e.g. 001_create_db to 099_create_final_table and see the whole order at a glance. ChatGPT said to do the "separate folders for db/schema/tables etc." method initially, but also said that for rerunning scripts it can be easier to have everything in one folder, especially for simple projects.