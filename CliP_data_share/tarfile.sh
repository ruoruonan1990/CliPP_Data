#!/bin/bash

# Define the base directory
base_dir="/Users/rli10/Downloads/CliP_data_share/PCAWG"

# Loop through subdirectories in the base directory
for subdirectory in "${base_dir}"/*; do
  if [ -d "${subdirectory}" ]; then
    summary_table="${subdirectory}/summary_table"
    if [ -d "${summary_table}" ]; then
      echo "${summary_table}"
      cd ${subdirectory}
      tar -czf summary_table.tar.gz summary_table
      echo "Tarred 'summary_table' in ${subdirectory}"
    fi
  fi
done

