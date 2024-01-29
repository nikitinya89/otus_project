#!/bin/bash
cp /root/otus_project/srv3/000-default.conf /etc/apache2/sites-available/000-default.conf
systemctl reload apache2
cp /root/otus_project/srv3/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

backup_dir="/root/otus_project/mysql_backup/"
for db_dir in $(ls $backup_dir); do
    db=$(basename $db_dir)
    for tbl_dir in $(ls $backup_dir/$db); do
        tbl=$(basename $tbl_dir)
        tbl_backup="$backup_dir/$db/$tbl/$tbl.sql"
        mysql -u root -e "CREATE DATABASE IF NOT EXISTS $db;"
        mysql -u root $db < $tbl_backup
    done
done

#DB_NAME="wordpress_db"
#DB_USER="wordpress"
#DB_PASSWORD="2Z%Zv3W93%"
#MYSQL_COMMANDS="CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
#GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
#FLUSH PRIVILEGES;"
#mysql -e "$MYSQL_COMMANDS"

DB_REPL_USER="repl"
DB_REPL_PASSWORD="52v#Q&Xvvs"
MYSQL_COMMANDS="STOP REPLICA;
CHANGE REPLICATION SOURCE TO SOURCE_HOST='10.0.0.11', SOURCE_USER='$DB_REPL_USER', SOURCE_PASSWORD='$DB_REPL_PASSWORD', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;
START REPLICA;"
mysql -e "$MYSQL_COMMANDS"

cp /root/otus_project/srv3/mysql.sh /root/mysql.sh
chmod +x /root/mysql.sh
new_crontab="0 23 * * 6 /root/mysql.sh"
current_crontab=$(crontab -l 2>/dev/null)
echo "$current_crontab" > temp_crontab
echo "$new_crontab" >> temp_crontab
crontab temp_crontab
rm temp_crontab
