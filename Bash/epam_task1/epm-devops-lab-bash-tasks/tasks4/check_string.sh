#!/bin/bash

# Check if input is empty
if [ -z "$1" ]; then
        echo "Usage: $0 <string>"
        exit 0
fi

input="$1"

letters=$(echo -n "$input" | grep -o "[a-zA-Z]" | wc -l)
numbers=$(echo -n "$input" | grep -o "[0-9]" | wc -l)
symbols=$(echo -n "$input" | grep -o "[*!@#$%^&()_+]" | wc -l)

echo "Numbers: $numbers Symbols: $symbols Letters: $letters"
