echo "* Adjust firewall rules"
firewall-cmd --add-port 8080/tcp --permanent
firewall-cmd --add-port 5044/tcp --permanent
firewall-cmd --reload