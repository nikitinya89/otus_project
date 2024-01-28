#!/bin/bash
rsync -av /root/otus_project/srv2/wordpress/ /var/www/
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
rm /var/www/html/index.html
systemct  reload apache2
cp /root/otus_project/srv2/mysqld.cnf /etc/mysql/mysql.conf.d
chmod 644 /etc/mysql/mysql.conf.d
systemct  restart mysql
