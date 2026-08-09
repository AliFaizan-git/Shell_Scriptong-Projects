#!/bin/bash

echo " HELLO! THIS IS BASH SCRIPTING"
name="ALI"
echo "My name is $name"
#this is comment
read -p "enter your prefered language: " lang
echo "$name fav language is $lang"

read -p "enter file name to check: " fileName
if [ -f "$fileName" ]; then
        echo "File '$fileName' exists! "
elif [ -d "$fileName" ]; then
        echo "'$fileName' is a directory"
else 
        echo "'$fileName' dont exit "
fi 

