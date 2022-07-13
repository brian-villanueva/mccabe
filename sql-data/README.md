### Converting Snowflake CSV files to SQL files

#### Generating SQL files

To generate SQL files from a Snowflake CSV file, 
run this command from inside the sql-data directory:
```shell
./csv-to-sql-files.sh data_0_0_0.csv 35
```
There are two arguments that are passed to the script:
* CSV filename
* Maximum number of statements to export (optional).  Default: **30**

#### Analyzing SQL files
Once the `input` directory is populated with data, you can run `mcc` from the project 
root directory like this:
```shell
mcc -l sql -d sql-data/input
```
It will produce output like this:
```text
{
    "sql-data/input/statement2.sql": 0,
    "sql-data/input/statement3.sql": 5,
    "sql-data/input/statement1.sql": 6,
    "sql-data/input/statement4.sql": 0,
    "sql-data/input/statement5.sql": 2,
    "sql-data/input/statement7.sql": 2,
    "sql-data/input/statement10.sql": 4,
    "sql-data/input/statement6.sql": 1,
    "sql-data/input/statement8.sql": 6,
    "sql-data/input/statement9.sql": 6
}
```