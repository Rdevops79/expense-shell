source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "INput MySQL Password is Missing"
  exit 1    ## here by using the exit script we stop the exection part because if any mistake is there the it should stop
fi

HEADING Installing MySQL Server
dnf install mysql-server -y &>>/tmp/expense.log
if [ $? -eq 0]then
  echo SUCCESS
  else
    echo FAILURE
    EXIT2
fi

HEADINB Start Nginx Server
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
if [ $? -eq 0]then
  echo SUCCESS
  else
    echo FAILURE
    EXIT2
fi

HEADING Set Root Password
mysql_secure_installation --set-root-pass $1 &>>/tmp/expense.log
## PASSWORD-ExPenseApp@1
if [ $? -eq 0]then
  echo SUCCESS
  else
    echo FAILURE
    EXIT2
fi