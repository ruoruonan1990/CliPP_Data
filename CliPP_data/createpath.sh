#!/bin/bash

# Define the base directory
base_dir="./CliP_data_share/PCAWG"

# Define the output file
output_file="output.txt"

# Create or truncate the output file
> "$output_file"

# Loop through subdirectories in the base directory
for subdirectory in "${base_dir}"/*; do
  #echo "${subdirectory}"
  if [ -d "${subdirectory}" ]; then
    subdirectory_name=$(basename "${subdirectory}")
    csv_file="${subdirectory}/${subdirectory_name}.csv"
    tar_file="${subdirectory}/summary_table.tar.gz"
    
    if [ -f "${csv_file}" ] && [ -f "${tar_file}" ]; then
      echo -e "<tr>" >> "$output_file"
      echo -e "<td>" >> "$output_file"
      echo -e "${subdirectory_name}" >> "$output_file"
      echo -e "</td>" >> "$output_file"
      echo -e "<td>" >> "$output_file"
      echo -e "<a href=\"${csv_file}\">link</a>" >> "$output_file"
      echo -e "</td>" >> "$output_file"
      echo -e "<td>" >> "$output_file"
      echo -e "<a href=\"${tar_file}\">link</a>" >> "$output_file"
      echo -e "</td>" >> "$output_file"
      echo -e "</tr>" >> "$output_file"
    fi
  fi
done

