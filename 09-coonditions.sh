#!/bin/bash

echo "Please enter a Number::"

read -s NUMBER #here NUMBER is the variable
echo "Number entered: $NUMBER"

#-gt, -lt, -eq, -ge, -le 
if [ $NUMBER -gt 100 ]
then
    echo "Given number is greater than 100"
else
    echo "Given number is less than or equal to 100"
fi