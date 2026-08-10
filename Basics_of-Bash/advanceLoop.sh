#!/bin/bash

# ==============================================================================
# BASH LOOPS DEMONSTRATION & EXPLANATION SCRIPT
# ==============================================================================

echo "======================================================================"
echo "                   UNDERSTANDING LOOPS IN BASH"
echo "======================================================================"
echo "Loops allow you to repeat a block of code multiple times based on"
echo "lists of items, dynamic ranges, or boolean conditions."
echo ""

# ------------------------------------------------------------------------------
# 1. FOR LOOPS (Item List & Globbing)
# ------------------------------------------------------------------------------
echo "--- 1. BASIC FOR LOOP (Iterating over a list) ---"
echo "Concept: Loops through a defined list of items one by one."
echo ""

for item in "Apple" "Banana" "Cherry"; do
    echo "  [Fruit]: $item"
done

echo ""
echo "--- 1b. FOR LOOP (Iterating over files/globbing) ---"
echo "Concept: Uses wildcards (*) to loop through matching files in a directory."
echo ""

for file in *.sh; do
    echo "  [Found Script]: $file"
done

echo ""

# ------------------------------------------------------------------------------
# 2. FOR LOOPS (Ranges & Steps)
# ------------------------------------------------------------------------------
echo "--- 2. FOR LOOP WITH RANGES {START..END..STEP} ---"
echo "Concept: Uses brace expansion to count numbers without listing them out."
echo ""

# Count from 1 to 5
echo "Counting 1 to 5:"
for i in {1..5}; do
    echo -n " $i"
done
echo ""

# Count by 2s (Step)
echo "Counting by 2s (1 to 9):"
for i in {1..9..2}; do
    echo -n " $i"
done
echo -e "\n"

# ------------------------------------------------------------------------------
# 3. C-STYLE FOR LOOPS
# ------------------------------------------------------------------------------
echo "--- 3. C-STYLE FOR LOOP ---"
echo "Concept: Syntax: for (( init; condition; increment )). Useful for index math."
echo ""

for (( i=1; i<=3; i++ )); do
    echo "  Index iteration: $i"
done

echo ""

# ------------------------------------------------------------------------------
# 4. WHILE LOOPS
# ------------------------------------------------------------------------------
echo "--- 4. WHILE LOOP ---"
echo "Concept: Keeps running AS LONG AS the condition evaluates to TRUE."
echo ""

count=1
while [ $count -le 3 ]; do
    echo "  While count is $count (Condition: 3 or less)"
    ((count++)) # Increment count
done

echo ""

# ------------------------------------------------------------------------------
# 5. UNTIL LOOPS
# ------------------------------------------------------------------------------
echo "--- 5. UNTIL LOOP ---"
echo "Concept: Opposite of while. Keeps running UNTIL the condition becomes TRUE"
echo "         (or runs as long as the condition remains FALSE)."
echo ""

target=3
current=1

until [ $current -gt $target ]; do
    echo "  Until count: $current (Stops when greater than $target)"
    ((current++))
done

echo ""

# ------------------------------------------------------------------------------
# 6. LOOP CONTROL: BREAK & CONTINUE
# ------------------------------------------------------------------------------
echo "--- 6. LOOP CONTROL (break & continue) ---"
echo "Concept:"
echo "  - 'continue': Skips the rest of the current iteration."
echo "  - 'break'   : Exits the loop entirely."
echo ""

for num in {1..5}; do
    if [ $num -eq 2 ]; then
        echo "  [Skipping $num using 'continue']"
        continue
    fi
    if [ $num -eq 4 ]; then
        echo "  [Stopping loop at $num using 'break']"
        break
    fi
    echo "  Processing number: $num"
done