#!/bin/bash

# Install Ultima version de Ansible
sudo yum install epel-release
sudo yum update && sudo yum upgrade
sudo yum -y install ansible

# Corre el yml para el Deploy del LoadBalancer sobre NGINX
cd /vagrant
ansible-playbook setup.yml 

