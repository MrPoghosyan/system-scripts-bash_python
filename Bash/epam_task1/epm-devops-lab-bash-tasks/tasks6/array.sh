#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
	echo "Usage: $0 <number_of_folders>"
	exit 1
fi

count=$1
# Check if number is valid (1-26)
if (( count < 1 || count > 26 )); then
	echo "Please provide a number between 1 and 26"
	exit 1
fi

# Create folders
for (( i=0; i<count; i++ )); do
	folder_name="folder_$(printf "\\$(printf '%03o' $((97 + i)))")"
	mkdir -p "$folder_name"
done

echo "$count folder(s) created:"
ls -d folder_* | head -n "$count"
