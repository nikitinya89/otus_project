#!/bin/bash
cp /root/otus_project/srv4/prometheus.yml /etc/prometheus/prometheus.yml
chmod 644 /etc/prometheus/prometheus.yml
cp /root/otus_project/srv4/grafana.db /var/lib/grafana/
chmod 640 /var/lib/grafana/grafana.db
chown grafana:grafana /var/lib/grafana/grafana.db
systemctl daemon-reload
systemctl restart prometheus
systemctl restart grafana-server
