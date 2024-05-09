 echo installing nginx
 dnf install nginx -y

 echo coping expense config file
 cp expense.conf /etc/nginx/default.d/expense.conf

 echo cleaning old content
 rm -rf /usr/share/nginx/html/*

 echo download front end content
 curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
 cd /usr/share/nginx/html

 echo extracting the content
 unzip /tmp/frontend.zip

 echo restart service
 systemctl restart nginx
 systemctl enable nginx
