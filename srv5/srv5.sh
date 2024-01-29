#!/bin/bash
cp ~/otus_project/srv5/jvm.options /etc/elasticsearch/jvm.options.d/jvm.options
cp ~/otus_project/srv5/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
cp ~/otus_project/srv5/kibana.yml /etc/kibana/kibana.yml
cp ~/otus_project/srv5/logstash.yml /etc/logstash/logstash.yml
cp ~/otus_project/srv5/logstash-nginx-es.conf /etc/logstash/conf.d/logstash-nginx-es.conf
chmod 644 /etc/elasticsearch/jvm.options.d/jvm.options
chmod 660 /etc/elasticsearch/elasticsearch.yml
chmod 660 /etc/kibana/kibana.yml
chmod 644 /etc/logstash/logstash.yml
chmod 644 /etc/logstash/conf.d/logstash-nginx-es.conf
systemctl daemon-reload
systemctl restart elasticsearch.service
systemctl restart kibana.service
systemctl restart logstash.service
sleep 15
cd ~/otus_project/srv5/
curl -X POST "localhost:5601/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana.ndjson
