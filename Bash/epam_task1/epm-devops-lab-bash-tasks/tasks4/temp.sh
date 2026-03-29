#!/bin/bash

# Check if input is empty
if [ -z "$1" ]; then
	echo "Usage: $0 temp->C or K!"
	exit 0
fi

input="$1"
num=${input::-1}  # all except last char
unit=${input: -1} # last char

if [[ "$unit" == "C" ]]; then
	result=$((num + 273))
	echo "${result}K"
elif [[ "$unit" == "K" ]]; then
	result=$((num - 273))
	echo "${result}C"
else
	echo "Invalid input, please specify C or K"
	exit 1
fi
