#!/bin/bash
source components/common.sh
MSPACE=$(cat $0 | grep Print | awk -F '"' '{print $2}' | awk '{ print length }'|sort|tail -1)

COMPONENT_NAME=MongoDB
COMPONENT=mongodb

Print "Download Repo"
curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/roboshop-devops-project/${COMPONENT}/main/mongo.repo &>>$LOG
Stat $?

Print "Install ${COMPONENT_NAME}"
yum install -y ${COMPONENT}-org &>>$LOG
Stat $?

Print "Update ${COMPONENT_NAME} Config"
sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf &>>$LOG
Stat $?

Print "Starting ${COMPONENT_NAME}"
systemctl restart mongod &>>$LOG
Stat $?

Print "Enabling ${COMPONENT_NAME}"
systemctl enable mongod &>>$LOG
Stat $?

DOWNLOAD "/tmp"

Print "Load Schema"
cd /tmp/${COMPONENT}-main
for db in catalogue users; do
  mongo < $db.js &>>$LOG
done
Stat $?
