#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
	echo "Usage: $0 <string>"
	exit 1
fi

input="$1"
output=""

# Loop through string characters in revers
for (( i=${#input}-1; i>=0; i-- )); do
	char="${input:$i:1}"

	# If uppercast, convert to lowercase, else convert to uppercase
	if [[ "$char" =~ [A-Z] ]]; then
		output+="${char,,}" # lowercase
	elif [[ "$char" =~ [a-z] ]]; then
		output+="${char^^}" # uppercase
	else
		output+="$char"     # non-alphabetic characters remain
	fi
done

echo "$output"
