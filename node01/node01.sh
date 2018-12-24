#!/bin/bash
hostnamectl set-hostname node01
echo "vagrant:vagrant" | chpasswd

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

sed -i "\$ a $1 192.168.100.8\t\t$NEW_HOST master\t$NEW_HOST" /etc/hosts
sed -i "\$ a $1 192.168.100.9\t\t$NEW_HOST node01\t$NEW_HOST" /etc/hosts
sed -i "\$ a $1 192.168.100.10\t\t$NEW_HOST node02\t$NEW_HOST" /etc/hosts

sudo systemctl restart sshd
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
sudo apt-key fingerprint 0EBFCD88
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install -y docker.io
sudo apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo modprobe br_netfilter
sudo echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
sudo echo 1 > /proc/sys/net/bridge/bridge-nf-call-ip6tables
sudo sysctl -p
systemctl daemon-reload
systemctl restart kubelet
systemctl restart docker
systemctl enable docker
systemctl enable kubelet && systemctl restart kubelet

reboot
