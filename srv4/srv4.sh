#!/bin/bash

apt install prometheus -y
cp ~/repo/srv4/prometheus.yml /etc/prometheus/prometheus.yml
chmod 644 /etc/prometheus/prometheus.yml
systemctl daemon-reload
systemctl restart prometheus
systemctl enable prometheus
dpkg -i /root/repo/srv4/grafana*.deb
apt -f install -y
cp ~/repo/srv4/grafana.db /var/lib/grafana/
chmod 640 /var/lib/grafana/grafana.db
chown grafana:grafana /var/lib/grafana/grafana.db
systemctl daemon-reload
systemctl start grafana-server

