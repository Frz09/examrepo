#!/bin/bash

echo "* Set policies as LEGACY"
sudo update-crypto-policies --set LEGACY

echo "* Import the repository key"
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

echo "* Register the repository"
sudo cat > /etc/yum.repos.d/elasticsearch.repo <<EOF
[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
EOF

echo "* Install Elasticsearch, Logstash, and Kibana"
sudo dnf install --enablerepo=elasticsearch -y elasticsearch logstash kibana

echo "* Deploy configuration for Elasticsearch"
sudo cp -v /vagrant/elasticsearch.yml /etc/elasticsearch/

echo "* Correct the Java heap size for Elasticsearch"
sudo cat > /etc/elasticsearch/jvm.options.d/jvm.options <<EOF
-Xms1g
-Xmx1g
EOF
    
echo "* Create beats configuration for Logstash"
sudo cat > /etc/logstash/conf.d/beats.conf << EOF
input {
  beats {
    port => 5044
  }
}
output {
  elasticsearch {
    hosts => ["http://server:9200"]
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
  }
}
EOF

echo "* Deploy configuration for Kibana"
sudo cp -v /vagrant/kibana.yml /etc/kibana/

echo "* Start the services"
sudo systemctl daemon-reload
sudo systemctl enable --now elasticsearch
sudo systemctl enable --now logstash
sudo systemctl enable --now kibana