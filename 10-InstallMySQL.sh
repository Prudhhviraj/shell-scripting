#!bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Need Root access to install mysql"
else
    dnf install mysql
fi
