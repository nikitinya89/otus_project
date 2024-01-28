#!/bin/bash
rsync -av /root/otus_project/srv2/wordpress/ /var/www/
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
rm /var/www/html/index.html
systemct  reload apache2
