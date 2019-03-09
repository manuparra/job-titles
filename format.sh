#! /bin/bash

JOB_TITLES_FILE=job-titles.txt
JOB_TITLES_JSON_FILE=job-titles.json

echo "Formatting: $JOB_TITLES_FILE";
JOB_TITLES=$( cat $JOB_TITLES_FILE | tr A-Z a-z | sed -e "s/-/ /g" | sed -e "s/,//g" | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//' | uniq | sort )
printf '%b\n' "$JOB_TITLES" > $JOB_TITLES_FILE

echo "Generating: $JOB_TITLES_JSON_FILE"
JOB_TITLES_JSON=$(printf '%b\n' $JOB_TITLES | sed -e 's/\(.*\)/    "\1",/' | sed "$ s/.$//")
JOB_TITLES_JSON="{\n  \"job-titles\": [\n${JOB_TITLES_JSON}\n  ]\n}"
printf '%b\n' "$JOB_TITLES_JSON" > $JOB_TITLES_JSON_FILE

