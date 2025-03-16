#! /bin/bash


echo "All variables passed: $@"
echo "Number of variables:$#"
echo "Script Name: $0"
echo "Present Working Directory: $PWD"
echo "Which user is running this script: $USER"
echo "Process Id of Current Script: $$"
sleep 60 &
echo "Process Id of last command in Background: $!"
