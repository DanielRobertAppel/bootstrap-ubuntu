#!/bin/bash

# This script MUST be run as sudo or root
if [[ $USER != 'root' ]]; then
	printf "\nThis script must be run as sudo or root\n"
	exit 0
fi

# Disabling the Automatic Unattended Updates
systemctl stop unattended-upgrades.service
systemctl disable unattended-upgrades.service

# Killing any automated updates that might be hogging the system
for process in $(ps aux | grep "apt" | grep -v "grep" | awk '[print $2]'); do
	kill -9 $process
done

# Updating repositories
apt-get update

# Installing ansible
apt-get install --yes python3 python3-pip python3-apt
pip3 install ansible

# Run Ansible Playbook
ansible-playbook ./bootstrap-n2plus.yml --ask-become-pass

# Reminder to reboot
printf "\n\tIf everything went well, then it is a good idea to reboot\n"