source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "INput MySQL Password is Missing"
  exit 1
fi

HEADING Installing MySQL Server
dnf install mysql-server -y
echo exit status-$?

HEADINB Start Nginx Server
systemctl enable mysqld
systemctl start mysqld
echo exit status-$?

HEADING Set Root Password
mysql_secure_installation --set-root-pass $1
## PASSWORD-ExPenseApp@1
echo exit status-$?