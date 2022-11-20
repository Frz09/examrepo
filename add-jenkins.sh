#!/bin/bash

echo "* Add Jenkins repository"
wget https://pkg.jenkins.io/redhat/jenkins.repo -O /etc/yum.repos.d/jenkins.repo

echo "* Import Jenkins repository key"
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

echo "* Install Jenkins"
sudo dnf install -y jenkins

echo "* Adjust jenkins user"
echo 'user:passwd' | jenkins admin

echo "* Adjust group membership"
usermod -aG jenkins vagrant

echo "* Start Jenkins"
systemctl enable --now jenkins

echo "* admin password is:"
sudo cat /home/vagrant/.jenkins/secrets/initialAdminPassword