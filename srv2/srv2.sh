#!/bin/bash
rsync -av /root/otus_project/srv2/wordpress/ /var/www/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
