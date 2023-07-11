echo -e "\e[31m>>>>>>>>> Setup NodeJS repos <<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[31m>>>>>>>>> Setup NodeJS repos <<<<<<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[31m>>>>>>>>> user add roboshop <<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[31m>>>>>>>>> setup an app directory <<<<<<<<<<\e[0m"
mkdir /app 

echo -e "\e[31m>>>>>>>>> Download the application code  <<<<<<<<<<\e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip 
cd /app 
unzip /tmp/cart.zip

echo -e "\e[31m>>>>>>>>> download the dependencies  <<<<<<<<<<\e[0m"
cd /app 
npm install 

echo -e "\e[31m>>>>>>>>> copy cart service  <<<<<<<<<<\e[0m"
cp cart.service /etc/systemd/system/cart.service

echo -e "\e[31m>>>>>>>>> daemon reload  <<<<<<<<<<\e[0m"
systemctl daemon-reload

echo -e "\e[31m>>>>>>>>> Start Cart service  <<<<<<<<<<\e[0m"
systemctl enable cart 
systemctl start cart