#!/bin/bash

# Before you are able to install drivers,
# you probably need to have a compatible (version compatible) GCC compiler
# and/or wrapper/suite/automated-toolset (make, automake, ninja, etc.)


printf "\n\tChecking for common build dependencies which might be used to compile drivers\n"

# script must be run as root or with sudo
if [[ $USER != 'root' ]]; then
	printf "\n\tThis script must be run as root or with sudo\n"
	exit 0
fi

# Check for needed non-standard apt-repositories, but don't just slam them
# in to the /etc/apt directory like an idiot
printf "\n\tChecking for graphics-drivers ppa"
if [[ $(grep -r "graphics-drivers" /etc/apt | grep -v "deb-src" ) = '' ]]; then
    printf "\n\tAdding graphics-drivers repository\n"
    add-apt-repository ppa:graphics-drivers/ppa -y
    GRAPHICAL_DRIVERS_ADDED='t'
fi



# Let apt manage what packages already exist, and which ones to install
apt-get --yes install \
apt-transport-https \
autoconf \
automake \
bison \
build-essential \
check \
cmake \
curl \
docbook \
docbook-dsssl \
expect \
flex \
gcc \
g++ \
git \
git-doc \
libreadline-dev \
libtool \
locales \
m4 \
make \
nasm \
ninja-build \
openjade \
p7zip-full \
pkg-config \
python3 \
python3-dev \
python3-pip \
python3-ply \
python3-setuptools \
ruby \
software-properties-common

# Print final information to the end-user about switching their graphical driver (if applicable)
if [[ $GRAPHICAL_DRIVERS_ADDED = 't' ]]; then
    printf "\n\tIMPORTANT: A repository of graphics drivers was added to your OS, however, you must use the 'drivers' application in order to fully install a candidate driver.  This is done separately from this script because graphics drivers can be heaven or hell, and a human needs to be present to manage that.\n"
fi
