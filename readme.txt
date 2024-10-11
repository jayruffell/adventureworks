my plan is to practice creating a data warehouse in SQL Server using the AdventureWorks OLTP data, and then migrating to Snowflake. As described here 
https://jay-ruffell-test.atlassian.net/browse/SCRUM-273

that Jira ticket contains a link to the  adventure works Github page, which has instructions for how to create the database. 

Its best practice to store DB files somewhere outside of \Documents so they can be version controlled separately from OneDrive/Google Drive.


- I created the OLTP database using this file "C:\adventureworks\AdventureWorks-oltp-install-script\instawdb.sql",  but see notes below for tweaks I had to make.


Update:  going to try to create the DW as described in this set of tutorials
https://robinphetsavongdata.wordpress.com/2019/06/16/introduction-end-to-end-b-i-solution-with-the-microsoft-adventure-works-sample-data-set/
https://robinphetsavongdata.wordpress.com/2019/06/18/part-1-designing-and-building-the-data-warehous/
https://robinphetsavongdata.wordpress.com/2019/06/19/part-2-designing-and-building-the-data-warehouse-dimension-tables/
https://robinphetsavongdata.wordpress.com/2019/06/26/99/
https://robinphetsavongdata.wordpress.com/2019/07/03/part-4-automating-a-data-pipeline/



NOTE FOR INSTALLING THE ADVENTUREWORKS DB:
- had to run like this in SQLCMD mode
:r "C:\adventureworks\AdventureWorks-oltp-install-script\instawdb.sql"

- after first updating instawdb.sql to have this line near the top:
:setvar SqlSamplesSourceDataPath "C:\adventureworks\AdventureWorks-oltp-install-script\" *including last slash*