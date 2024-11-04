*ctrl + k, v to view a preview of this file in markdown in VS Code, with my markdown extension*

# overview
- This folder contains my first attempts at creating a data warehouse (and connecting a PBI report to it), which I did from the adventure works data.
- I have a confluence page where I recorded my key learnings. I'm not providing the link here, because it is likely I will re-factor things once I've done a few other data engineering/warehousing tutorials. But it should be easy to find within my Knowledgebase Space (https://jay-ruffell-test.atlassian.net/wiki/spaces/KB/overview).
- I created the initial OLTP database using this file `C:\adventureworks\AdventureWorks-oltp-install-script\instawdb.sql`,  which I downloaded here https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/adventure-works
- To create the data warehouse I primarily followed these tutorials:
https://robinphetsavongdata.wordpress.com/2019/06/16/introduction-end-to-end-b-i-solution-with-the-microsoft-adventure-works-sample-data-set/
https://robinphetsavongdata.wordpress.com/2019/06/18/part-1-designing-and-building-the-data-warehous/
https://robinphetsavongdata.wordpress.com/2019/06/19/part-2-designing-and-building-the-data-warehouse-dimension-tables/
https://robinphetsavongdata.wordpress.com/2019/06/26/99/
https://robinphetsavongdata.wordpress.com/2019/07/03/part-4-automating-a-data-pipeline/
 and this one also useful for understanding SSIS  a bit better, since the above links are light on the detail  
https://www.youtube.com/watch?v=cYu-cP8qsl0

# project summary and file structure

1. All DB tables etc. were created in my `SQLDEV` SQL Server instance.
2. For designing the data warehouse facts and dimensions I followed the tutorial above, with the exception that I simplified things (fewer columns and fewer dimensions) – just because I wanted to do an MVP data warehouse.
2. I also added in a table that pulled public holiday data via API, using python – just because I wanted to try python for ETL and I also wanted to try pulling data via API. That code lives here `C:\adventureworks\python_scripts\create-public-hols-table`, and it created the `Staging.Python.holidays table`. I am currently running it via task Manager on a schedule, just for practice.
3. In my first attempt at creating the data warehouse I **DID NOT** use the SSIS package approach for ETL'ing (the approach used by the above tutorial). In the name of incremental improvements I did everything in SQL the first time round, before migrating the SQL code into an SSIS package. **Notes on this "non-SSIS" approach**:
3a. The SSIS code for creating DW tables (i.e. ETL code written in SQL) lives in `./SQLscripts`
3b. This SQL code creates the data warehouse in the `AdventureWorksDW` database on `SQLDEV`.
3c. I connected a PBI to this data warehouse just for playing around.
4. In my second attempt at creating the data warehouse I followed the SSIS approach in the tutorial.  **Notes on this SSIS approach**:
4.a the code for this lives in `./AdventureWorks-SSIS-ETL`. I still used SQL to (1) create the DW tables, and then (2) practice loading data into the stables, creating indexes etc. - since this code still needs to go into the SSIS package - but that was just for testing, and is labelled as such.
4.b. The "production" code for running the ETL and populating the DW is SQL that lives inside of the SSIS package, similar (although not exactly the same) as in the above tutorial.
4.b.i it wasn't clear from the tutorial how he actually created his package, but I believe he used GUI tools rather than copy pasting SQL scripts. But ChatGPT told me to just use scripts, which worked well. See the YouTube link above for how this works.
4.c. the SSIS package now runs on a schedule using SQL Agent, as described in the tutorial. And it populates the data warehouse called `AdventureWorksDW_SSIS` in `SQLDEV`.
5. **In this "second attempt" I also made use of staging tables**, since this is best practice. I copied the OLTP database into a staging database, per the scripts here .`\AdventureWorks-SSIS-ETL\SQL-scripts\tables\AdWorksOLTP-staging-tables`, and then the SSIS package used the staging tables as the source.
6. **Neither of these tutorials covered incremental loads**, they took an approach that I do not believe would be used often in practice – truncating the existing target table and then loading the entire existing source table into it.

# more on dir structure
- Note directory structure matches that recommended by ChatGPT for  ordering and version controlling scripts. ( note ChatGPT also suggested you could have  separate  parent directories for development, test, and  production, which you would combine with git branches for more stringent control of prod environments - i.e. to promote from dev -> test you work on dev, then switch to test, then merge *and copy files from dev to test* [itself easily automateable in bash]). But  for modern and more nimble development environments you can just have a singlefolder structure and control promotion via branches alone.
- More on directory structure: Opening Solutions and Projects inside SSMS produces default folders including `Queries` and `Connections` ( similar to my `config` folder). I should do more research to look into the benefits of using the native SSMS approach, as it may give me some best practice ideas.

# things I haven't done in this tutorial that I might like to
-  using tools like **LiquiBase** and **Flyway**  for automated deployments, rollback scripts, etc.
- trying  to promote from my  development environment (`SQLDEV`)to my preproduction environment (`SQLPREPROD`).  (note I don't have a production environment because I only have the free developer version of SQL Server).  Liquibase and flyway might be good for this to.
-  Migrating my database to somewhere else, e.g. Azure, Snowflake.


