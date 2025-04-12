#!/bin/bash

USERID=$(id -u)
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal color

SOURCE_DIR="/home/ec2-user/app-logs"

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

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR::Need Root/admin access for EXECUTION"
        exit 1
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -name "*.log" -mtime +14)
echo "Files to delete: $FILES_TO_DELETE" &>>$LOG_FILE_NAME
# if [ -z "$FILES_TO_DELETE" ]
# then
#     echo "No files to delete" &>>$LOG_FILE_NAME
# else
#     for file in $FILES_TO_DELETE
#     do
#         rm -f $file &>>$LOG_FILE_NAME
#         VALIDATE $? "Deleting $file"
#     done
# fi
# echo "Script completed at: $(date +%Y-%m-%dT%I:%M:%S)" &>>$LOG_FILE_NAME

while read -r file
do
    echo "Deleting file: $file" &>>$LOG_FILE_NAME
    rm -f $file &>>$LOG_FILE_NAME
    # if [ ! -f $file ]
    # then
    #     echo "File $file does not exist" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -w $file ]
    # then
    #     echo "File $file is not writable" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -r $file ]
    # then
    #     echo "File $file is not readable" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -s $file ]
    # then
    #     echo "File $file is empty" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -e $file ]
    # then
    #     echo "File $file does not exist" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -f $file ]
    # then
    #     echo "File $file is not a regular file" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -d $file ]
    # then
    #     echo "File $file is not a directory" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -L $file ]
    # then
    #     echo "File $file is not a symbolic link" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -x $file ]
    # then
    #     echo "File $file is not executable" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -O $file ]
    # then
    #     echo "File $file is not owned by the current user" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -G $file ]
    # then
    #     echo "File $file is not owned by the current group" &>>$LOG_FILE_NAME
    #     continue
    # fi
    # if [ ! -r $file ]
    # then
    #     echo "File $file is not readable" &>>$LOG_FILE_NAME
    #     continue
    # fi
    rm -f $file &>>$LOG_FILE_NAME
    VALIDATE $? "Deleting $file"
done <<< "$FILES_TO_DELETE"
echo "Script completed at: $(date +%Y-%m-%dT%I:%M:%S)" &>>$LOG_FILE_NAME

