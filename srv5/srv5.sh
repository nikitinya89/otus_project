#!/bin/bash

dpkg -i /root/elasticsearch*.deb
dpkg -i /root/kibana*.deb
dpkg -i /root/logstash*.deb
apt install default-jdk -y
apt -f install -y
cp ~/repo/srv5/jvm.options /etc/elasticsearch/jvm.options.d/jvm.options
cp ~/repo/srv5/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
cp ~/repo/srv5/kibana.yml /etc/kibana/kibana.yml
cp ~/repo/srv5/logstash.yml /etc/logstash/logstash.yml
cp ~/repo/srv5/logstash-nginx-es.conf /etc/logstash/conf.d/logstash-nginx-es.conf
chmod 644 /etc/elasticsearch/jvm.options.d/jvm.options
chmod 644 /etc/elasticsearch/elasticsearch.yml
chmod 644 /etc/kibana/kibana.yml
chmod 644 /etc/logstash/logstash.yml
chmod 644 /etc/logstash/conf.d/logstash-nginx-es.conf
systemctl daemon-reload
systemctl enable --now elasticsearch.service
systemctl enable --now kibana.service
systemctl enable --now logstash.service
systemctl restart elasticsearch.service
systemctl restart kibana.service
systemctl restart logstash.service
