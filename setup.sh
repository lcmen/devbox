#!/usr/bin/env bash

read -r -s -p "[sudo] sudo password for $(whoami): " pass

echo "${pass}" | sudo -S apt install --yes software-properties-common
echo "${pass}" | sudo -S apt-add-repository --yes --update ppa:ansible/ansible
echo "${pass}" | sudo -S apt update
echo "${pass}" | sudo -S apt install --yes -–no-install-recommends ansible python3-pip
pip3 install -r requirements.txt

echo "Provisioning"
ansible-playbook -i inventories/local site.yml
