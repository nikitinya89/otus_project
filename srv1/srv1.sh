#!/bin/bash

dpkg -i ~/repo/srv1/filebeat*.deb
apt install prometheus-node-exporter -y
cp ~/repo/srv1/nginx.conf /etc/nginx/nginx.conf
chmod 644 /etc/nginx/nginx.conf
cp ~/repo/srv1/frontend.conf /etc/nginx/sites-available/frontend.conf
chmod 644 /etc/nginx/sites-available/frontend.conf
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/frontend.conf /etc/nginx/sites-enabled/frontend.conf
systemctl reload nginx
cp ~/repo/srv1/filebeat.yml /etc/filebeat/filebeat.yml
chmod 644 /etc/filebeat/filebeat.yml
systemctl restart filebeat
sudo filebeat modules enable nginx
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
