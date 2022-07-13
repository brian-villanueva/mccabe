#!/bin/bash

# script assumes a file with one statement per line.

INPUT_FILE="${1:-file-trimmed.csv}"
TARGET_DIR="input"

i=1
while IFS= read -r line
do
  echo "$line" > ${TARGET_DIR}/statement${i}.sql
  ((i=i+1))
done < "${INPUT_FILE}"

echo "${i} files written."