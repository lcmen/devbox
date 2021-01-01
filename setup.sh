#!/usr/bin/env bash

read -r -s -p "[sudo] sudo password for $(whoami): " pass

echo "Installinb Ansible and its dependencies"
echo "${pass}" | sudo -S apt install --yes --no-install-recommends python3-pip software-properties-common
pip3 install -r requirements.txt

echo "Provisioning"
~/.local/bin/ansible-playbook -i inventories/local site.yml

echo "Cleaning up"
echo "${pass}" | sudo -S apt autoremove
echo "${pass}" | sudo -S apt autoclean
