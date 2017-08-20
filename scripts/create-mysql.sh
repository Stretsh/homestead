#!/usr/bin/env bash

cat > /root/.my.cnf << EOF
[client]
user = homestead
password = secret
host = localhost
EOF

cp /root/.my.cnf /home/vagrant/.my.cnf

DB=$1;
USER=$2;
PASS=$3



mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB\` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci";
# echo "DB Created";
if [[ "$USER" != "homestead" ]]; then
	mysql -e "CREATE USER IF NOT EXISTS '$USER'@'localhost' IDENTIFIED BY '$PASS';"
	mysql -e "GRANT ALL PRIVILEGES ON $DB.* TO '$USER'@'localhost';"
	mysql -e "FLUSH PRIVILEGES;"
fi
