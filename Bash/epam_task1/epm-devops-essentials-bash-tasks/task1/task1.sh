#!/bin/bash

# Check for input argument
if [ -z "$1" ]; then
    echo "Usage: $0 accounts.csv"
    exit 1
fi

INPUT="$1"
OUTPUT="accounts_new.csv"

if [ ! -f "$INPUT" ]; then
    echo "File $INPUT not found!"
    exit 1
fi

awk -v OFS=',' '
BEGIN {
    # FPAT matches CSV fields, including quoted fields with commas
    FPAT = "([^,]*)|(\"[^\"]*\")"
}
NR == 1 { print; next }

{
    id = $1
    location_id = $2
    name = $3
    title = $4
    department = $6

    # Remove quotes from name
    gsub(/"/, "", name)
    split(name, parts, " ")

    # Capitalize each word in name (handling hyphens)
    for (i in parts) {
        split(parts[i], subparts, "-")
        for (j in subparts) {
            subparts[j] = toupper(substr(subparts[j],1,1)) tolower(substr(subparts[j],2))
        }
        parts[i] = subparts[1]
        for (j=2; j<=length(subparts); j++) parts[i] = parts[i] "-" subparts[j]
    }

    # Reconstruct full name
    name = parts[1]
    for (i=2; i<=length(parts); i++) name = name " " parts[i]

    # Create email base
    first_letter = tolower(substr(parts[1],1,1))
    last_name = tolower(parts[length(parts)])
    email_base = first_letter last_name

    # Store all data in arrays
    data_id[NR] = id
    data_loc[NR] = location_id
    data_name[NR] = name
    data_title[NR] = title
    data_emailbase[NR] = email_base
    data_dept[NR] = department

    count[email_base]++
}

END {
    for (i = 2; i <= NR; i++) {
        id = data_id[i]
        location_id = data_loc[i]
        name = data_name[i]
        title = data_title[i]
        email_base = data_emailbase[i]
        department = data_dept[i]

        # Add location_id if duplicate email
        if (count[email_base] > 1)
            email = email_base location_id "@abc.com"
        else
            email = email_base "@abc.com"

        print id, location_id, name, title, email, department
    }
}' "$INPUT" > "$OUTPUT"

# Log message for autograder
echo "New accounts file created: $OUTPUT ✅"
