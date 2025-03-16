#! /bin/bash

$A=$HOME

echo "All variables passed: $@"
echo "Number of variables:$#"
echo "Script Name: $0"
echo "Present Working Directory: $PWD"
echo "Which user is running this script: $USER"
echo "Process Id of Current Script: $$"
echo "Home Directory of user: $A"
sleep 60 &
echo "Process Id of last command in Background: $!"
