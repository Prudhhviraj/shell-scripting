#! bin/bash


 
R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #normal color

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # Default to 14 days if not provided

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
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
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R ERROR: Source directory $SOURCE_DIR does not exist $N"
    exit 1
fi
if [ ! -d $DEST_DIR ]
then
    echo -e "$R ERROR: Destination directory $DEST_DIR does not exist $N"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -type f -name "*.log" -mtime +$DAYS)
echo "Files to backup: $FILES" &>>$LOG_FILE_NAME
if [ -z "$FILES" ]
then
    echo "$Y No files to backup $N"
    exit 1
else
    for file in $FILES
    do
        cp $file $DEST_DIR &>>$LOG_FILE_NAME
        VALIDATE $? "Backing up $file to $DEST_DIR"
    done
fi
echo "Script completed at: $(date +%Y-%m-%dT%I:%M:%S)" &>>$LOG_FILE_NAME
echo -e "$G Backup completed successfully $N"
echo -e "$G Backup files are available in $DEST_DIR $N"
echo -e "$G Backup files are older than $DAYS days $N"