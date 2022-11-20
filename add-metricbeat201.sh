#!/bin/bash

echo "* Download MetricBeat package"
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.4.3-x86_64.rpm

echo "* Install MetricBeat"
sudo rpm -Uvh metricbeat-8.4.3-x86_64.rpm

echo "* Deploy configuration"
sudo cp -v /vagrant/metricbeat.yml /etc/metricbeat/metricbeat.yml

echo "* Enable the system module"
metricbeat modules enable system

echo "* Install index template"
metricbeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["192.168.121.121:9200"]'

echo "* Enable and start the beat"
systemctl daemon-reload
systemctl enable --now metricbeat