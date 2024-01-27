#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion git prometheus -y
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/nikitinya89/otus_project.git
wgen -c https://mirror.yandex.ru/mirrors/packages.grafana.com/enterprise/deb/pool/main/g/grafana/grafana_10.2.0_amd64.deb
dpkg -i /root/grafana*.deb
apt -f install -y
systemctl enable --now prometheus
systemctl enable --now grafana
