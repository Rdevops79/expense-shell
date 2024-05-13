echo -e "\e[31mInstalling MySQL server\e[0m"
dnf install mysql-server -y
echo exit status-$?
echo -e "\e[31mStart Nginx Server\e[0m"
systemctl enable mysqld
systemctl start mysqld
echo exit status-$?
echo -e "\e[31mSet Root Password\e[0m"
mysql_secure_installation --set-root-pass $1
## PASSWORD-ExPensse@1
echo exit status-$?