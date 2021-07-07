# OPKU
On Premise Kubernetes running on Ubuntu 18 (bionic) 
vagrant-boxes
A vagrant box that provisions 
Prerequisites
1.	Install Oracle VM VirtualBox
2.	Install Vagrant


Creating a VM
You can now ask Vagrant to start up a VM as configured by the default Vagrantfile:

  vagrant up 

The VM is now running in Virtualbox. You can ssh into it (no password required) as follows:

  vagrant ssh # ssh in to the VM

    sudo bash

    kubeadm init --apiserver-advertise-address=192.168.100.8 --pod-network-cidr=192.168.1.0/16
    
    kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
    
    kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
    
    kubeadm config images pull
