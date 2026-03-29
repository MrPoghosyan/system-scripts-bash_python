#!/bin/bash
source ./functions.sh

# Pow examples
echo "Pow examples"
pow 2 3
pow 2 5

# Shortest string examples
echo -e "\nShortest string examples"
shortest "This" "is" "Bash" "Functions" "Task"
shortest "Java" "Bash" "Python"

# Print log examples
echo -e "\nPrint log examples"
print_log "Hello World!"
print_log "Hello Bash!"
