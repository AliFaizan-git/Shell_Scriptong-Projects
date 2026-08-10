#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: No option provided."
    echo "Usage: $0 [disk|memory|user]"
    exit 1
fi

OPTION="$1"

case "$OPTION" in
    disk)
        echo "=== Disk Usage ==="
        df -h /
        ;;
    memory)
        echo "=== Memory Usage ==="
        free -h
        ;;
    user)
        echo "=== Current User ==="
        echo "User: $(whoami) | Home: $HOME"
        ;;
    *)
        echo "Invalid option: $OPTION"
        echo "Usage: $0 [disk|memory|user]"
        exit 2
        ;;
esac

exit 0