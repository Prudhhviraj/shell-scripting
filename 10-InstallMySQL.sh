#!bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Need Root access to install mysql"
    exit 1
fi

dnf install mysql -y


if [ $? -ne 0 ] 
then 
    echo "Error:: Failed to Install My SQL"
    exit 1
else 
    echo "Success:: MysQL has been installed Successfully"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "Error:: Failed to install GIT"
    exit 1
else 
    echo "Success:: GIT has been installed Successfully"
fi