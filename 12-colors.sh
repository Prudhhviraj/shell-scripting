#!bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
     if [ $1 -ne 0 ] 
    then 
        echo -e "$2 ... $R Failed to Install My SQL $N"
        exit 1
    else 
        echo -e "$2 ... $G MYSQL has been installed Successfully $N"
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
        echo -e "MYSQL Already $Y Installed" $N
    fi

dnf list installed git

    if [ $? -ne 0 ]
    then
        dnf install git -y
        VALIDATE $? "Installing......."
    else
        echo -e "GIT is already $Y Installed" $N
    fi