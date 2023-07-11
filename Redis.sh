echo -e "\e[31m>>>>>>>>> Install redis repo <<<<<<<<<<\e[om"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

echo -e "\e[31m>>>>>>>>> Module Enable <<<<<<<<<<\e[om"
yum module enable redis:remi-6.2 -y

echo -e "\e[31m>>>>>>>>> Install redis <<<<<<<<<<\e[om"
yum install redis -y

echo -e "\e[31m>>>>>>>>> Update redis Listening Address <<<<<<<<<<\e[om"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf

echo -e "\e[31m>>>>>>>>> start redis <<<<<<<<<<\e[om"
systemctl enable redis 
systemctl start redis