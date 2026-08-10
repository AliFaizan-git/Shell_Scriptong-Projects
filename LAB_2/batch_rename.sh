#!/bin/bash

OLD_EXT="$1"
NEW_EXT="$2"

if [ -z "$OLD_EXT" ] || [ -z "$NEW_EXT" ]; then
    echo "Usage: $0 <old_extension> <new_extension>"
    exit 1
fi

count=0
for file in *."$OLD_EXT"; do
    if [ -f "$file" ]; then
        base=$(basename "$file" ."$OLD_EXT")
        mv "$file" "${base}.${NEW_EXT}"
        echo "Renamed: $file -> ${base}.${NEW_EXT}"
        ((count++))
    fi
done

if [ $count -eq 0 ]; then
    echo "No files found matching *.$OLD_EXT"
else
    echo "Total files renamed: $count"
fi