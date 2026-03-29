#!/bin/bash

# Function to raise a number to power
pow() {
    # Check if input is empty or less than 2 args
    if [ $# -eq 0 ] || [ $# -eq 1 ]; then
        echo "Usage: $0 arg_1 arg_2"
        return
    fi

    local base=$1
    local exp=$2
    local result=1
    for ((i=0; i<exp; i++)); do
        result=$((result * base))
    done
    echo "$result"
}

# Function to find the shortest string among arguments
shortest() {
    # Check if input is empty
    if [ $# -eq 0 ]; then
        echo "Input is empty!"
        return
    fi

    local min_len=${#1}
    local shortest_words=("$1")  # Array
    shift

    for str in "$@"; do
        local len=${#str}
        if [ $len -lt $min_len ]; then
            min_len=$len
            shortest_words=("$str")  # New shortest array
        elif [ $len -eq $min_len ]; then
            shortest_words+=("$str") # Add to array
        fi
    done

    # Print all shortest words
    for w in "${shortest_words[@]}"; do
        echo "$w"
    done
}

# Function to print a string with the current date
print_log() {
    if [ $# -eq 0 ]; then
        echo "Input is empty!"
        return
    fi
    local message="$1"
    local datetime
    datetime=$(date "+%Y-%m-%d %H:%M")
    echo "[$datetime] $message"
}
