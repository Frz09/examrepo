# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.define "pipelines" do |pipelines|
    pipelines.vm.box = "shekeriev/centos-stream-9"
    pipelines.vm.hostname = "pipelines.do1.exam"
    pipelines.vm.network "private_network", ip: "192.168.111.201"
    pipelines.vm.network "forwarded_port", guest: 8080, host: 8080
    pipelines.vm.provision "shell", path: "add-hosts.sh"
    pipelines.vm.provision "shell", path: "add-jenkins.sh"
    pipelines.vm.provision "shell", path: "add-java17.sh"
    pipelines.vm.provision "shell", path: "add-metricbeat201.sh"
    pipelines.vm.provision "shell", path: "add-git.sh"
    pipelines.vm.provision "shell", path: "firewall-pipelines.sh"

    pipelines.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 4096
      v.cpus = 2
    end
    pipelines.vm.synced_folder "files/", "/vagrant"

  end
  
  config.vm.define "containers" do |containers|
    containers.vm.box = "shekeriev/centos-stream-9"
    containers.vm.hostname = "containers.do1.exam"
    containers.vm.network "private_network", ip: "192.168.111.202"
    containers.vm.network "forwarded_port", guest: 8080, host: 8081
    containers.vm.provision "shell", path: "add-hosts.sh"
    containers.vm.provision "shell", path: "add-docker.sh"
    containers.vm.provision "shell", path: "add-java17.sh"
    containers.vm.provision "shell", path: "add-metricbeat202.sh"
    containers.vm.provision "shell", path: "add-git.sh"
    containers.vm.provision "shell", path: "firewall-containers.sh"

    containers.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 4096
      v.cpus = 1
    end
    containers.vm.synced_folder "files/", "/vagrant"

  end

  config.vm.define "monitoring" do |monitoring|
    monitoring.vm.box = "shekeriev/centos-stream-9"
    monitoring.vm.hostname = "monitoring.do1.exam"
    monitoring.vm.network "private_network", ip: "192.168.111.203"
    monitoring.vm.network "forwarded_port", guest: 5601, host: 8082
    monitoring.vm.provision "shell", path: "add-hosts.sh"
    monitoring.vm.provision "shell", path: "add-elasticstack.sh"
    monitoring.vm.provision "shell", path: "add-git.sh"
    monitoring.vm.provision "shell", path: "firewall-monitoring.sh"

    monitoring.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 4096
      v.cpus = 1
    end
    monitoring.vm.synced_folder "files/", "/vagrant"

  end
end