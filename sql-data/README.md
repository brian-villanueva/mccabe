### Converting Snowflake CSV files to SQL files

```shell
# handle multi-line statements which are separated by "\"
cat data_0_0_0.csv | sed -e :a -e '/\\$/N; s/\\\n//; ta' | tr -s ' ' > file-scrubbed.csv

# remove trailing values delimited by pipe ("|") so that we only have SQL statements
cat file-scrubbed.csv | sed 's/\|.*$//g' > file-trimmed.csv

# convert resulting file to individual .sql files, named as "statement[0-N].sql"
csv-to-sql-files.sh file-trimmed.csv
```

Once the `input` directory is populated with data, you can run `mcc` from the project 
root directory like this:
```text
mcc -l sql -d sql-data/input    
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