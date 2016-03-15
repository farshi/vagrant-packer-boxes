#!/bin/bash
# base.sh

VM_TYPE=$2
export DEBIAN_FRONTEND="noninteractive"

if [[ $VM_TYPE =~ Ubuntu_64 ]]; then
    echo "==> Updating Ubunto repo to mirror.rackspace.com"
    sed -i 's/us.archive.ubuntu.com/mirror.rackspace.com/' /etc/apt/sources.list
    sed -i 's/security.ubuntu.com/mirror.rackspace.com/' /etc/apt/sources.list
fi
if [[ $VM_TYPE =~ Debian_64 ]]; then
    echo "==> Updating Debian repo to mirror.rackspace.com"
    echo "
    # APT-Mirror of Rackspace
    deb http://mirror.rackspace.com/debian jessie main
    deb http://mirror.rackspace.com/debian jessie-updates main
    deb http://mirror.rackspace.com/debian-security jessie/updates main
    " | tee /etc/apt/sources.list
fi

# Update the box
echo "==> Performing upgrade..."
apt-get -y update  &> /dev/null
# apt-get -y dist-upgrade --force-yes &> /dev/null
apt-get -y upgrade &> /dev/null
