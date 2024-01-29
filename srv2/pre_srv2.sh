#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion git apache2 mysql-server-8.0 php8.1 php8.1-mysql libapache2-mod-php8.1 php8.1-cli php8.1-cgi php8.1-gd unison prometheus-node-exporter -y
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/nikitinya89/otus_project.git
chmod +x /root/otus_project/*/*.sh

echo -e "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n    . /etc/bash_completion\nfi" >> /root/.bashrc
echo -e "Host 10.0.0.*\n   StrictHostKeyChecking accept-new" >> /root/.ssh/config
exec bash --rcfile /root/.bashrc
