# devbox

Ansible playbook to provision my development environment based on Ubuntu and its derivatives (ElementaryOS, Pop!_OS, etc.).

## Run

1. Clone the repository
2. Run `./setup.sh`

## Debugging

To check all Ansible variables run:

```
ansible -i inventories/local -m setup all
```
