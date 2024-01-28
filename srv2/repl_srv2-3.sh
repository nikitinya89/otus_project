#!/bin/bash
unison /var/www ssh://10.0.0.12//var/www -owner -group
new_crontab="* * * * * unison -batch /var/www ssh://10.0.0.12//var/www &> /dev/null"
current_crontab=$(crontab -l 2>/dev/null)
echo "$current_crontab" > temp_crontab
echo "$new_crontab" >> temp_crontab
crontab temp_crontab
rm temp_crontab

DB_NAME="wordpress_db"
DB_USER="repl"
DB_PASSWORD="52v#Q&Xvvs"
MYSQL_COMMANDS="CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;"
mysql -e "$MYSQL_COMMANDS"


MYSQL_COMMANDS="STOP REPLICA;
CHANGE REPLICATION SOURCE TO SOURCE_HOST='10.0.0.11', SOURCE_USER=$DB_USER, SOURCE_PASSWORD=$DB_PASSWORD, SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;
START REPLICA;
