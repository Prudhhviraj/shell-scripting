#!bin/bash

USERID=$(id -u)
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal color

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

dnf list installed mysql &>>$LOG_FILE_NAME

    if [ $? -ne 0 ]
    then 
        dnf install mysql -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing.....MySQL" 
    else    
        echo -e "MYSQL Already $Y Installed" $N
    fi

dnf list installed git &>>$LOG_FILE_NAME

    if [ $? -ne 0 ]
    then
        dnf install git -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing.......GIT"
    else
        echo -e "GIT is already $Y Installed" $N
    fi