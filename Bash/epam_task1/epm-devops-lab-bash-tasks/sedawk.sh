#!/bin/bash

# Exit if passwd file does not exist
if [ ! -f passwd ]; then
    echo "File passwd not found!"
    exit 1
fi

# Step a: Copy passwd to passwd_new
cp passwd passwd_new

# Step b: Change shell for saned using AWK
awk -F: 'BEGIN{OFS=":"} $1=="saned"{$7="/bin/bash"} {print}' passwd_new > tmp && mv tmp passwd_new

# Step c: Change shell for avahi using SED
sed -i '/^avahi:/ s|/usr/sbin/nologin|/bin/bash|' passwd_new

# Step e: Remove lines containing "daemon"
sed -i '/daemon/d' passwd_new

# Step f: Change shell for users with even UID -> /bin/zsh
awk -F: 'BEGIN{OFS=":"} ($3 % 2 == 0){$7="/bin/zsh"} {print}' passwd_new > tmp && mv tmp passwd_new

# Step d: Keep only 1,3,5,7 columns
awk -F: 'BEGIN{OFS=":"} {print $1,$3,$5,$7}' passwd_new > tmp && mv tmp passwd_new

# Step g: Remove newline at the end
truncate -s -1 passwd_new 2>/dev/null || true

echo "✅ All modifications in passwd_new completed successfully!"
