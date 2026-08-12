#!/bin/bash

#disk check script
df -h | awk '{print $1 " " $5}' | while read output;
do
    echo "disk detail: $output"
    usage=$(echo $output |awk '{print $2}' | cut -d'%' -f1)
    # echo "usage: $usage"
    if [ $usage -gt 80 ]; then
        echo "warning: disk usage is above 80%"
    fi
done

