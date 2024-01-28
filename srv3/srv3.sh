#!/bin/bash
rm /var/www/html/index.html
cp /root/otus_project/srv3/mysqld.cnf /etc/mysql/mysql.conf.d
chmod 644 /etc/mysql/mysql.conf.d
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

DB_NAME="wordpress_db"
DB_USER="wordpress"
DB_PASSWORD="2Z%Zv3W93%"
MYSQL_COMMANDS="CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;"
mysql -e "$MYSQL_COMMANDS"
