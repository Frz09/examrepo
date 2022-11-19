echo "* Adjust firewall rules"
firewall-cmd --add-port 5000/tcp --permanent
firewall-cmd --add-port 5044/tcp --permanent
firewall-cmd --add-port 5601/tcp --permanent
firewall-cmd --add-port 9200/tcp --permanent
firewall-cmd --reload