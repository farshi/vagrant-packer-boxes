#!/bin/bash
# desktop.sh

VM_TYPE=$2
export DEBIAN_FRONTEND="noninteractive"

if [[ $VM_TYPE =~ Ubuntu_64 ]]; then
    echo "==> Installing Ubuntu Desktop"
    apt-get -y install --no-install-recommends ubuntu-desktop &> /dev/null
fi
if [[ $VM_TYPE =~ Debian_64 ]]; then
    echo "==> No desktop for Debian!"
fi
