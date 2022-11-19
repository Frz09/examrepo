#!/bin/bash

echo "* Add Jenkins repository"
sudo wget https://pkg.jenkins.io/redhat/jenkins.repo -O /etc/yum.repos.d/jenkins.repo

echo "* Import Jenkins repository key"
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

echo "* Install Jenkins"
sudo dnf install -y bash-completion jenkins