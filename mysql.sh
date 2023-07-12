echo -e "\e[31m>>>>>>>>>  disable MySQL 8 version <<<<<<<<<<\e[0m"
yum module disable mysql -y 

echo -e "\e[31m>>>>>>>>>  Setup the MySQL5.7 repo file <<<<<<<<<<\e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[31m>>>>>>>>>  Install MYSQL<<<<<<<<<<\e[0m"
yum install mysql-community-server -y

echo -e "\e[31m>>>>>>>>>  Start mysql <<<<<<<<<<\e[0m"
systemctl enable mysqld
systemctl start mysqld

echo -e "\e[31m>>>>>>>>>  change root password <<<<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

echo -e "\e[31m>>>>>>>>>  check new password <<<<<<<<<<\e[0m"
mysql -uroot -pRoboShop@1