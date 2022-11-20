echo "* Adjust firewall rules"
sudo firewall-cmd --add-port 8080/tcp --permanent
sudo firewall-cmd --add-port 5044/tcp --permanent
sudo firewall-cmd --reload