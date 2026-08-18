#!/usr/bin/env bash

# Enable Strict Mode
set -euo pipefail

# 1. Define a temporary directory for demo work
TEMP_DIR=$(mktemp -d -p .)
# 2. Define a Cleanup Function
cleanup() {
    local exit_code=$?
    echo ""
    echo "[TRAP] Cleaning up temporary files at $TEMP_DIR..."
    rm -rf "$TEMP_DIR"
    
    if [ $exit_code -ne 0 ]; then
        echo "[TRAP] Script finished WITH ERRORS (Exit code: $exit_code)."
    else
        echo "[TRAP] Script finished SUCCESSFULLY."
    fi
}

# 3. Register the trap: Run cleanup() whenever the script exits (EXIT signal)
trap cleanup EXIT

echo "=== Defensive Scripting Demo ==="
echo "Created temp folder: $TEMP_DIR"

# Creating a temporary file
touch "$TEMP_DIR/data.txt"

# --- DEMO 1: Proving 'set -u' prevents undefined variable accidents ---
# Uncommenting the line below will trigger 'set -u' and halt execution safely:
echo "Trying to use unassigned variable: $UNDEFINED_VAR"

# --- DEMO 2: Proving 'set -o pipefail' catches hidden pipeline errors ---
# Uncommenting the line below will fail because 'fakefile.txt' does not exist,
# even though 'grep' would otherwise hide the failure:
cat fakefile.txt | grep "anything"

# --- DEMO 3: Proving 'set -e' stops failure before bad steps happen ---
# echo "Attempting to read a missing file..."
cat non_existent_file.txt

# This line will NEVER run because 'set -e' killed the script above!
echo "This message will never print because the script already safely stopped."