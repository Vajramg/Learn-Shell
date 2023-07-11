echo -e "\e[31m>>>>>>>>> Setup NodeJS <<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[31m>>>>>>>>> Install NodeJS <<<<<<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[31m>>>>>>>>> user Add <<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[31m>>>>>>>>> creating directory <<<<<<<<<<\e[0m"
mkdir /app 

echo -e "\e[31m>>>>>>>>> Download the application code <<<<<<<<<<\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip 
cd /app 
unzip /tmp/user.zip

echo -e "\e[31m>>>>>>>>> Install dependencies. <<<<<<<<<<\e[0m"
cd /app 
npm install 

echo -e "\e[31m>>>>>>>>> Copy user.service file. <<<<<<<<<<\e[0m"
cp user.service /etc/systemd/system/user.service

echo -e "\e[31m>>>>>>>>> Load the service. <<<<<<<<<<\e[0m"
systemctl daemon-reload

echo -e "\e[31m>>>>>>>>> Start the service. <<<<<<<<<<\e[0m"
systemctl enable user 
systemctl start user

echo -e "\e[31m>>>>>>>>> setup MongoDB repo. <<<<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[31m>>>>>>>>> Install mongodb <<<<<<<<<<\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[31m>>>>>>>>> Load Schema <<<<<<<<<<\e[0m"
mongo --host mongodb-dev.vglabs.in:27017 </app/schema/user.js

