#!bin/bash

USERID=$(id -u)

VALIDATE(){
     if [ $1 -ne 0 ] 
    then 
        echo "$2 Failed to Install My SQL"
        exit 1
    else 
        echo "$2 MYSQL has been installed Successfully"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Need Root/admin access for installations"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing....." 
else    
    echo "MYSQL Already Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing......."
else
    echo "GIT is already Installed"
fi