#!/bin/bash
# dep.sh

echo "==> Installing packages..."
export DEBIAN_FRONTEND="noninteractive"

# Install packages
apt-get -y install mc sudo ntp screen curl &> /dev/null

# set locales
rm -rf /usr/lib/locale/*
echo "==> Setting locale"
echo "# set locale
en_US.UTF-8 UTF-8
hu_HU.UTF-8 UTF-8
" > /etc/locale.gen
echo "# default locale
LANG=en_US.UTF-8
LANGUAGE=en_US:en
" > /etc/default/locale
locale-gen &> /dev/null

# Tweak sshd to prevent DNS resolution (speed up logins)
echo "==> Tweak SSH..."
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Customize the message of the day
echo "==> Add welcome message..."
echo "Welcome to a $2 base box forged by Doka via packer.io!" > /etc/motd

# Adding a 2 sec delay to the interface up, to make the dhclient happy
echo "==> Adjust network interface..."
echo "pre-up sleep 2" >> /etc/network/interfaces
