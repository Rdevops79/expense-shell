 echo -e"\e[31m installing nginx\e[0m"
 dnf install nginx -y

 echo -e"\e[32m coping expense config file\e[0m"
 cp expense.conf /etc/nginx/default.d/expense.conf

 echo -e"\e[33m cleaning old content\e[0m"
 rm -rf /usr/share/nginx/html/*

 echo -e"\e[34m download front end content \e[0m"
 curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
 cd /usr/share/nginx/html

 echo -e"\e[35m extracting the content \e[0m"
 unzip /tmp/frontend.zip

 echo -e"\e[36m restart service\e[0m"
 systemctl restart nginx
 systemctl enable nginx
