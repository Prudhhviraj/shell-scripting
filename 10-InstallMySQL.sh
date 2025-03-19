#!bin/bash

APP1=$(mysql)
APP2=$(git)
STATUS=$(dnf list installed $APP1 and $APP2)

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Need Root/admin access for installations"
    exit 1
fi

$STATUS

if [ $? -ne 0 ]
then 
    dnf install $APP1 -y
    if [ $? -ne 0 ] 
    then 
    echo "Error:: Failed to Install My SQL"
    exit 1
    else 
    echo "Success:: $APP1 has been installed Successfully"
    fi
else    
    echo "$APP1 Already Installed"
fi

$STATUS

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Error:: Failed to install GIT"
        exit 1
    else 
        echo "Success:: GIT has been installed Successfully"
    fi
else
    echo "GIT is already Installed"
fi