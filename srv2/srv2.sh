#!/bin/bash
rsync -av /root/otus_project/srv2/wordpress/ /var/www/
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
cp /root/otus_project/srv2/000-default.conf /etc/apache2/sites-available/000-default.conf
systemctl reload apache2
cp /root/otus_project/srv2/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
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
DB_REPL_USER="repl"
DB_REPL_PASSWORD="52v#Q&Xvvs"
MYSQL_COMMANDS="CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
CREATE USER '$DB_REPL_USER'@'%' IDENTIFIED BY '$DB_REPL_PASSWORD';
GRANT REPLICATION SLAVE ON *.* TO '$DB_REPL_USER'@'%';
FLUSH PRIVILEGES;"
mysql -e "$MYSQL_COMMANDS"

unison -batch /var/www ssh://10.0.0.12//var/www -owner -group
new_crontab="* * * * * unison -batch /var/www ssh://10.0.0.12//var/www &> /dev/null"
current_crontab=$(crontab -l 2>/dev/null)
echo "$current_crontab" > temp_crontab
echo "$new_crontab" >> temp_crontab
crontab temp_crontab
rm temp_crontab
