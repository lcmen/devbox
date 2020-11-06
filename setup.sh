#!/usr/bin/env bash

read -r -s -p "[sudo] sudo password for $(whoami): " pass

echo "Installinb Ansible and its dependencies"
echo "${pass}" | sudo -S apt install --yes --no-install-recommends software-properties-common
echo "${pass}" | sudo -S apt-add-repository --yes --update ppa:ansible/ansible
echo "${pass}" | sudo -S apt install --yes --no-install-recommends ansible python3-pip
pip3 install -r requirements.txt

echo "Provisioning"
ansible-playbook -i inventories/local site.yml

echo "Cleaning up"
echo "${pass}" | sudo -S apt autoremove
echo "${pass}" | sudo -S apt autoclean
