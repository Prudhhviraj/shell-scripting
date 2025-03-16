#!/bin/bash

A1=$NUMBER

echo "Please enter a Number:$A1"

read -s NUMBER #here NUMBER is the variable
echo "Number entered: $A1"

#-gt, -lt, -eq, -ge, -le 
if [ $A1 -gt 100 ]
then
    echo "Given number is greater than 100"
else
    echo "Given number is less than or equal to 100"
fi