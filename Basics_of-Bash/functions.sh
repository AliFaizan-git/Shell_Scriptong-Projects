#!/bin/bash

print_header() {
    echo "========================================"
    echo "  $1"
    echo "========================================"
}

add_numbers() {
    local num1=$1
    local num2=$2
    local sum=$((num1 + num2))

    echo "$sum"
}

print_header "MATH CALCULATOR"

a=15
b=25

total=$(add_numbers $a $b)

echo "The sum of $a and $b is: $total"