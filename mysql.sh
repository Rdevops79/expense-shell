source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "INput MySQL Password is Missing"
  exit 1    ## here by using the exit script we stop the exection part because if any mistake is there the it should stop
fi

HEADING Installing MySQL Server
dnf install mysql-server -y &>>/tmp/expense.log
STAT $?

HEADING Start nginx Server
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
STAT $?

HEADING Set Root Password
mysql_secure_installation --set-root-pass $1 &>>/tmp/expense.log
## PASSWORD-ExPenseApp@1
STAT $?