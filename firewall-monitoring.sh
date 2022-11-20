echo "* Adjust firewall rules"
sudo firewall-cmd --add-port 5000/tcp --permanent
sudo firewall-cmd --add-port 5044/tcp --permanent
sudo firewall-cmd --add-port 5601/tcp --permanent
sudo firewall-cmd --add-port 9200/tcp --permanent
sudo firewall-cmd --reload