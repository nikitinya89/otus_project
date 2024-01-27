#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion git nginx prometheus-node-exporter -y
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/nikitinya89/otus_project.git
chmod +x /root/otus_project/*/*.sh
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/f/filebeat/filebeat-8.9.1-amd64.deb
dpkg -i /root/filebeat*.deb
systemctl daemon-reload
systemctl enable --now filebeat
