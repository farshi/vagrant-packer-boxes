#!/bin/bash
# base.sh

VM_TYPE=$2
export DEBIAN_FRONTEND="noninteractive"

if [[ $VM_TYPE =~ Ubuntu_64 ]]; then
    echo "==> Updating Ubunto repo to mirror.rackspace.com"
    sed -i 's/us.archive.ubuntu.com/mirror.rackspace.com/' /etc/apt/sources.list
fi
if [[ $VM_TYPE =~ Debian_64 ]]; then
    echo "==> Updating Debian repo to mirror.rackspace.com"
    sed -i 's/http.debian.net/mirror.rackspace.com/' /etc/apt/sources.list
fi

# Update the box
echo "==> Performing dist-upgrade (all packages and kernel)"
apt-get -y update  &> /dev/null
# apt-get -y dist-upgrade --force-yes &> /dev/null
apt-get -y dist-upgrade --force-yes
reboot
sleep 60
