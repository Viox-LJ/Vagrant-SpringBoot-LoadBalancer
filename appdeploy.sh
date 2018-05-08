#!/bin/bash

# Instala ultima version de Ansible

sudo yum install epel-release
sudo yum update && sudo yum upgrade
sudo yum -y install ansible

# Ejecuta el Deploy de los Nodos de las SpringBoot
cd /vagrant
ansible-playbook appdeploy.yml


