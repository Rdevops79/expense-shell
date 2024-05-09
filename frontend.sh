 echo -e "\e[31minstalling nginx\e[0m"
 dnf install nginx -y

 echo -e "\e[32mcoping expense config file\e[0m"
 cp expense.conf /etc/nginx/default.d/expense.conf

 echo -e "\e[33mcleaning old content\e[0m"
 rm -rf /usr/share/nginx/html/*

 echo -e "\e[34mdownload front end content \e[0m"
 curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
 cd /usr/share/nginx/html

 echo -e "\e[35mextracting the content \e[0m"
 unzip /tmp/frontend.zip

 echo -e "\e[36mrestart service\e[0m"
 systemctl restart nginx
 systemctl enable nginx

