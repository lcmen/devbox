#!/usr/bin/env bash

read -r -s -p "[sudo] sudo password for $(whoami): " pass

echo "${pass}" | sudo -S apt install --yes software-properties-common
echo "${pass}" | sudo -S apt-add-repository --yes --update ppa:ansible/ansible
echo "${pass}" | sudo -S apt update
echo "${pass}" | sudo -S apt install --yes ansible

echo "Provisioning"
ansible-playbook -i inventories/local site.yml
