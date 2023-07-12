echo -e "\e[31m>>>>>>>>>  Install Maven <<<<<<<<<<\e[0m"
yum install maven -y

echo -e "\e[31m>>>>>>>>>  user add <<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[31m>>>>>>>>>  setup an app directory <<<<<<<<<<\e[0m"
mkdir /app 

echo -e "\e[31m>>>>>>>>>  created app directory <<<<<<<<<<\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip 
cd /app 
unzip /tmp/shipping.zip

echo -e "\e[31m>>>>>>>>>  download the dependencies & build the application <<<<<<<<<<\e[0m"
cd /app 
mvn clean package 
mv target/shipping-1.0.jar shipping.jar 

echo -e "\e[31m>>>>>>>>>  copy shipping service <<<<<<<<<<\e[0m"
cp shipping.service /etc/systemd/system/shipping.service

echo -e "\e[31m>>>>>>>>>  loading daemon <<<<<<<<<<\e[0m"
systemctl daemon-reload

echo -e "\e[31m>>>>>>>>>  start shipping <<<<<<<<<<\e[0m"
systemctl enable shipping 
systemctl start shipping

echo -e "\e[31m>>>>>>>>>  install mysql <<<<<<<<<<\e[0m"
yum install mysql -y 

echo -e "\e[31m>>>>>>>>>  Load Schema <<<<<<<<<<\e[0m"
mysql -h mysql-dev.vglabs.in -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo -e "\e[31m>>>>>>>>>  restart shipping <<<<<<<<<<\e[0m"
systemctl restart shipping