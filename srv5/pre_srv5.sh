#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion git prometheus-node-exporter -y
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/nikitinya89/otus_project.git
chmod +x /root/otus_project/*/*.sh
apt install default-jdk -y
mkdir /root/elk
cd /root/elk
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/e/elasticsearch/elasticsearch-8.9.1-amd64.deb
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/k/kibana/kibana-8.9.1-amd64.deb
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/l/logstash/logstash-8.9.1-amd64.deb
dpkg -i /root/elk/elasticsearch*.deb
dpkg -i /root/elk/kibana*.deb
dpkg -i /root/elk/logstash*.deb
cd /root/
systemctl daemon-reload
systemctl enable --now elasticsearch
systemctl enable --now kibana
systemctl enable --now logstash
systemctl enable --now prometheus-node-exporter
echo -e "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n    . /etc/bash_completion\nfi" >> /root/.bashrc
echo -e "Host 10.0.0.*\n   StrictHostKeyChecking accept-new" >> /root/.ssh/config
exec bash --rcfile /root/.bashrc
