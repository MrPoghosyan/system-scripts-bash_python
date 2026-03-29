#!/bin/bash

# Check if input is empty
if [ -z "$1" ]; then
	echo "Usage: $0 <array>"
	exit 0
fi

IFS=',' read -r -a array <<< "$1"
sum=0

for num in "${array[@]}"; do
	if (( num % 2 == 0 )); then
		sum=$((sum + num))
	fi
done

echo "$sum"
