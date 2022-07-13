#!/bin/bash

INPUT_FILE="${1:-data_0_0_0.csv}"
MAX_FILES=${2:-30}
TARGET_DIR="input"

# handle multi-line statements which are separated by "\"
cat ${INPUT_FILE} | sed -e :a -e '/\\$/N; s/\\\n//; ta' | tr -s ' ' > ${INPUT_FILE}.scrubbed

# remove trailing values delimited by pipe ("|") so that we only have SQL statements
cat ${INPUT_FILE}.scrubbed | sed 's/\|.*$//g' > ${INPUT_FILE}.trimmed

INPUT_FILE="${INPUT_FILE}.trimmed"

i=1
while IFS= read -r line
do
  echo "$line" > ${TARGET_DIR}/statement${i}.sql
  if [ $i == $MAX_FILES ]; then break; fi
  ((i=i+1))
done < "${INPUT_FILE}"

echo "${i} files written."
rm -f ${INPUT_FILE}.scrubbed ${INPUT_FILE}.trimmed