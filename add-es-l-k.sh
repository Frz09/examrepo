#!/bin/bash

echo "* Download Elasticsearch package"
sudo wget https://artifacts.elastic.co/downloads/elasticsearch-8.4.3-x86_64.rpm

echo "* Install Elasticsearch"
sudo rpm -Uvh elasticsearch-*.rpm

echo "* Download Logstash package"
wget https://artifacts.elastic.co/downloads/logstash/logstash-8.4.3-x86_64.rpm

echo "* Install Logstash"
sudo rpm -Uvh logstash-*.rpm

echo "* Download Kibana package"
wget https://artifacts.elastic.co/downloads/kibana/kibana-8.4.3-x86_64.rpm

echo "* Install Kibana"
sudo rpm -Uvh kibana-*.rpm