#!/usr/bin/env bash

read -s -p "[sudo] sudo password for $(whoami): " pass

echo "${pass}" | sudo -S apt-add-repository --yes --update ppa:ansible/ansible
echo "${pass}" | sudo -S apt update
echo "${pass}" | sudo -S apt install --yes ansible software-properties-common

echo "Clonning playbook into ${PWD}/devbox"
git clone https://github.com/lowski/devbox.git && cd devbox

echo "Provisioning"
ansible-playbook -i inventories/local site.yml
