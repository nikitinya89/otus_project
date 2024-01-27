#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion git -y
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y
# mkdir ~/repo && cd ~/repo && git init
# git config --global user.name "Yuriy Nikitin"
# git config --global user.email nikitinya89@gmail.com
# git branch -m master main
# git remote add origin git@github.com:nikitinya89/otus_project.git
git clone https://github.com/nikitinya89/otus_project.git
chmod +x ~/otus_project/*/*.sh
apt install default-jdk -y
mkdir ~/elk
cd ~/elk
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/e/elasticsearch/elasticsearch-8.9.1-amd64.deb
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/k/kibana/kibana-8.9.1-amd64.deb
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/l/logstash/logstash-8.9.1-amd64.deb
dpkg -i ~/elk/elasticsearch*.deb
dpkg -i ~/elk/kibana*.deb
dpkg -i ~/elk/logstash*.deb
systemctl daemon-reload
systemctl enable --now elasticsearch
systemctl enable --now kibana
systemctl enable --now logstash
