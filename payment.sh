echo -e "\e[31m>>>>>>>>>  install python <<<<<<<<<<\e[0m"
yum install python36 gcc python3-devel -y

echo -e "\e[31m>>>>>>>>> Add application User <<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[31m>>>>>>>>>  add app directory <<<<<<<<<<\e[0m"
mkdir /app 

echo -e "\e[31m>>>>>>>>>  Download the application code <<<<<<<<<<\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip 
cd /app 
unzip /tmp/payment.zip

echo -e "\e[31m>>>>>>>>>  download the dependencies <<<<<<<<<<\e[0m"
cd /app 
pip3.6 install -r requirements.txt

echo -e "\e[31m>>>>>>>>>  copy payment service <<<<<<<<<<\e[0m"
cp payment.service /etc/systemd/system/payment.service

echo -e "\e[31m>>>>>>>>>  daemon reload <<<<<<<<<<\e[0m"
systemctl daemon-reload

echo -e "\e[31m>>>>>>>>>  start payment <<<<<<<<<<\e[0m"
systemctl enable payment 
systemctl start payment