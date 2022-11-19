#!/bin/bash

echo "* Download MetricBeat package"
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.4.3-x86_64.rpm

echo "* Install MetricBeat"
sudo rpm -Uvh metricbeat-8.4.3-x86_64.rpm