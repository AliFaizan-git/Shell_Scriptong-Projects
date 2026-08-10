#!/bin/bash

LOG_FILE="$1"

analyze_errors() {
    local file="$1"
    local error_count=0

    echo "--- Processing Log: $file ---"
    while read -r line; do
        if [[ "$line" == ERROR* ]]; then
            echo "[ALERT FOUND] $line"
            ((error_count++))
        fi
    done < "$file"

    echo "Total errors detected: $error_count"
}

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

analyze_errors "$LOG_FILE"