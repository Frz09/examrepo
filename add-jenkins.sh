#!/bin/bash

echo "* Add Jenkins repository"
wget https://pkg.jenkins.io/redhat/jenkins.repo -O /etc/yum.repos.d/jenkins.repo

echo "* Import Jenkins repository key"
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

echo "* Install Jenkins"
dnf install -y jenkins

echo "* Adjust jenkins user"
usermod -s /bin/bash jenkins | passwd jenkins
echo -e 'admin/admin'

echo "* Adjust group membership"
usermod -aG jenkins

echo "* Start Jenkins"
systemctl enable --now jenkins

#Where is the directory on CentOS9
# echo "* admin password is:"
#cat /var/lib/jenkins/secrets/initialAdminPassword