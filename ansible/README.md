Useful tutorial: https://serversforhackers.com/c/an-ansible-tutorial

Ansible

Uses python/ssh (usually pre-installed, hence simple to get started).
Clientless, no agents

Only install Ansible on Ansible Controller (the master).

There are 2 main command line tools:
ansible (shell): ansible <host-pattern> [-m module_name] [-a args] [options]
ansible-playbook (invoke script): ansible-playbook [options] playbook.yml

Concepts
Inventory: usally a collection of host names.
Groups: hosts are grouped together.

Example inventory at /etc/ansible/hosts

Roles: services.
Modules: “plugins” (Modules can do things like install software, copy files, use templates and much more - http://docs.ansible.com/modules_by_category.html.).

Setup is useful – displays much information about the host. 
Use: ansible -m module -i inventory [-a args] host|group

Tasks: step 
Tags: not always used, but can e.g. filter hosts
