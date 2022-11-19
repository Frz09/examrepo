#!/bin/bash

echo "* Download MetricBeat package"
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.4.3-x86_64.rpm

echo "* Install MetricBeat"
rpm -Uvh metricbeat-8.4.3-x86_64.rpm

echo "* Deploy configuration"
cp -v /vagrant/metricbeat.yml /etc/metricbeat/metricbeat.yml

echo "* Enable the system module"
metricbeat modules enable system

echo "* Install index template"
metricbeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["192.168.111.202:9200"]'

echo "* Enable and start the beat"
systemctl daemon-reload
systemctl enable --now metricbeat