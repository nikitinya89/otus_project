#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion git prometheus prometheus-node-exporter -y
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/nikitinya89/otus_project.git
chmod +x /root/otus_project/*/*.sh
wget -c https://mirror.yandex.ru/mirrors/packages.grafana.com/enterprise/deb/pool/main/g/grafana/grafana_10.2.0_amd64.deb
dpkg -i /root/grafana*.deb
apt -f install -y
systemctl enable --now prometheus
systemctl enable --now prometheus-node-exporter
systemctl enable --now grafana-server
echo -e "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n    . /etc/bash_completion\nfi" >> /root/.bashrc
echo -e "Host 10.0.0.*\n   StrictHostKeyChecking accept-new" >> /root/.ssh/config
exec bash --rcfile /root/.bashrc
