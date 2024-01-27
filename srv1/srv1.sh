#!/bin/bash
cp ~/repo/srv1/nginx.conf /etc/nginx/nginx.conf
chmod 644 /etc/nginx/nginx.conf
cp ~/repo/srv1/frontend.conf /etc/nginx/sites-available/frontend.conf
chmod 644 /etc/nginx/sites-available/frontend.conf
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/frontend.conf /etc/nginx/sites-enabled/frontend.conf
systemctl reload nginx
cp ~/repo/srv1/filebeat.yml /etc/filebeat/filebeat.yml
chmod 644 /etc/filebeat/filebeat.yml
systemctl daemon-reload
systemctl restart filebeat
sudo filebeat modules enable nginx
