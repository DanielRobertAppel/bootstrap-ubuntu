#!/bin/bash

## TODO : use salt or Ansible to replace this script

# Check if root
if [[ $USER != 'root' ]]; then
	printf "\nscript must be run as sudo or root\n"
	exit 0
fi


apt install --yes python3 python3-pip python3-apt
pip3 install ansible
ansible-playbook ./bootstrap-elementary-os.yml --ask-become-pass

# Adding PPAs
#printf "\nAdding PPAs to your system...\n"
#add-apt-repository --yes ppa:ubuntu-mozilla-security/ppa
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
#sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Update apt cache
#apt-get update

# Install updated packages
#apt-get upgrade --yes

# Install Browsers
#sudo apt-get install --yes firefox google-chrome-stable

# remove obsolete packages
#apt-get autoremove --yes
