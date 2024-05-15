source common.sh
rm -f /tmp/expense.log

 HEADING installing nginx
 dnf install nginx -y &>>/tmp/expense.log
 echo exit status-$?

 HEADING coping expense config file
 cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
 echo exit status-$?

 HEADING cleaning old content
 rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo exit status-$?

 HEADING download front end content
 curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/tmp/expense.log
 echo exit status-$?

cd /usr/share/nginx/html

 HEADING extracting the content
 unzip /tmp/frontend.zip &>>/tmp/expense.log
 echo exit status-$?

 HEADING restart service
 systemctl restart nginx &>>/tmp/expense.log
 systemctl enable nginx &>>/tmp/expense.log
  echo exit status-$?

