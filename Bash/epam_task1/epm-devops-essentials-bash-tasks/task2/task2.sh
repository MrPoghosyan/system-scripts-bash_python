#!/bin/bash

# Check arguments
if [ $# -ne 1 ]; then
  echo "Usage: $0 <path_to_output.txt>"
  exit 1
fi

input_file="$1"
output_file="output.json"

if [ ! -f "$input_file" ]; then
  echo "Error: File '$input_file' not found!"
  exit 1
fi

# Read test name
testName=$(grep "^\[" "$input_file" | sed -E 's/^\[ ([^]]+) \].*/\1/')

# Start JSON structure
echo "{" > "$output_file"
echo " \"testName\": \"$testName\"," >> "$output_file"
echo " \"tests\": [" >> "$output_file"

# Parse test lines
# Example lines:
# not ok  1  expecting command finishes successfully (bash way), 7ms
# ok  2  expecting command prints some message (the same as above, bats way), 10ms

tests=$(grep -E "^(ok|not ok)" "$input_file")
count=$(echo "$tests" | wc -l)
i=0

echo "$tests" | while read -r line; do
  ((i++))
  
  if [[ $line == ok* ]]; then
    status=true
  else
    status=false
  fi

  # Extract name and duration
  name=$(echo "$line" | sed -E 's/^(ok|not ok)[[:space:]]+[0-9]+[[:space:]]+(.*),[[:space:]]*[0-9]+ms/\2/')
  duration=$(echo "$line" | grep -oE '[0-9]+ms')

  echo "   {" >> "$output_file"
  echo "     \"name\": \"$name\"," >> "$output_file"
  echo "     \"status\": $status," >> "$output_file"
  echo "     \"duration\": \"$duration\"" >> "$output_file"
  
  if [ $i -lt $count ]; then
    echo "   }," >> "$output_file"
  else
    echo "   }" >> "$output_file"
  fi
done

echo " ]," >> "$output_file"

# Parse summary
# Example:
# 1 (of 2) tests passed, 1 tests failed, rated as 50%, spent 17ms

summary=$(grep "tests passed" "$input_file")
success=$(echo "$summary" | grep -oE '^[0-9]+')
failed=$(echo "$summary" | grep -oE '[0-9]+ tests failed' | awk '{print $1}')
rating=$(echo "$summary" | grep -oE 'rated as [0-9]+(\.[0-9]+)?%' | grep -oE '[0-9]+(\.[0-9]+)?')
duration=$(echo "$summary" | grep -oE '[0-9]+ms$')

echo " \"summary\": {" >> "$output_file"
echo "   \"success\": $success," >> "$output_file"
echo "   \"failed\": $failed," >> "$output_file"
echo "   \"rating\": $rating," >> "$output_file"
echo "   \"duration\": \"$duration\"" >> "$output_file"
echo " }" >> "$output_file"

echo "}" >> "$output_file"

echo "✅ JSON conversion completed successfully!"
echo "📄 Output file created at: $path/output.json"
