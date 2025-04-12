#! bin/bash


 
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal color

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # Default to 14 days if not provided

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%dT%I:%M:%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
     if [ $1 -ne 0 ] 
    then 
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else 
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

USAGE(){
    echo -e "$R USAGE: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME