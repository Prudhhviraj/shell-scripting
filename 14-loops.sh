#!bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-scripting"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%dT%I:%M:%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
     if [ $1 -ne 0 ] 
    then 
        echo -e "$2 ... $R Failed to Install $N"
        exit 1
    else 
        echo -e "$2 ... $G Installed Successfully $N"
    fi
}
echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "Need Root/admin access for installations"
    exit 1
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then 
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else 
        echo -e "$package is already installed $Y ... Installed $N"
    fi 

done