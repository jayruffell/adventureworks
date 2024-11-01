I created the "create table" scripts by running "Tasks > Generate scripts" in the OLTP database - this told me what the cols were. 

Note: several of the: types were "user-defined types",  which ChatGPT says is a good idea for enforcing standards, quality, etc.  I could have recreated these user-defined types and then created the tables, but as a shortcut I just found the types that gave an error when I tried to create the table and changed them to a generic type, OR commented out those cols.

 Note also I maintained primary keys, which ChatGPT says is a good idea. But foreign keys can be - and were - skipped.