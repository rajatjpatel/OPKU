# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
 config.vm.box = "ubuntu/bionic64"
   config.vm.define "master" do |a|
   a.vm.provider "libvirt" do |v|
   v.storage :file, :size => '20G'
   v.default_nic_type = "82540EM"
    v.memory = 2048
    v.cpus = 2
    end
  a.vm.network "private_network", ip: "192.168.100.8"
  a.vm.synced_folder ".", "/vagrant", disabled: true
  a.vm.synced_folder "scripts/k8smaster.example.com", "/usr/local/scripts", type: "rsync", owner: "root", group: "root"
  a.vm.provision "shell", inline: <<-SHELL
   chmod u+x /usr/local/scripts/k8smaster.sh
   /usr/local/scripts/k8smaster.sh
  SHELL
 end
 config.vm.define "node01" do |b|
    b.vm.provider "libvirt" do |v|
    v.storage :file, :size => '20G'
    v.default_nic_type = "82540EM"
    v.memory = 2048
    v.cpus = 1
  end
  b.vm.network "private_network", ip: "192.168.100.9"
  b.vm.synced_folder ".", "/vagrant", disabled: true
  b.vm.synced_folder "scripts/node01.example.com", "/usr/local/scripts", type: "rsync", owner: "root", group: "root"
  b.vm.provision "shell", inline: <<-SHELL
   chmod u+x /usr/local/scripts/node01.sh
   /usr/local/scripts/node01.sh
  SHELL
  end
 config.vm.define "node02" do |c|
    c.vm.provider "libvirt" do |v|
    v.storage :file, :size => '20G'
    v.default_nic_type = "82540EM"
    v.memory = 2048
    v.cpus = 1
  end
  c.vm.network "private_network", ip: "192.168.100.10"
  c.vm.synced_folder ".", "/vagrant", disabled: true
  c.vm.synced_folder "scripts/node02.example.com", "/usr/local/scripts", type: "rsync", owner: "root", group: "root"
  c.vm.provision "shell", inline: <<-SHELL
   chmod u+x /usr/local/scripts/node02.sh
   /usr/local/scripts/node02.sh
  SHELL
  end
  end
