# Vagrant boxes made by Packer

Create Ubuntu and Debian server boxes for [Vagrant](https://docs.vagrantup.com/v2/why-vagrant/index.html) by [Packer](https://packer.io/intro)

## Prerequisites

Install Vagrant, Packer and [VirtualBox](https://www.virtualbox.org).

## Clone vagrant-packer-boxes

    mkdir -p ~/Vagrant/PackerBoxes
    cd ~/Vagrant/PackerBoxes
    git clone https://github.com/doka/vagrant-packer-boxes.git
    cd vagrant-packer-boxes

## Set environmental variables

- cache directory

    export PACKER_CACHE_DIR="~/Vagrant/PackerBoxes/vagrant-packer-boxes/cache"


## Buils the base box locally

    packer build debian-8.2.json

The first build will run longer than usually, since the ISO files will be first downloaded. Follow download process by watching the cache directory.

The base box will be at '''~/Vagrant/PackerBoxes/vagrant-packer-boxes/builds/virtualbox'''. This is a tar file, you can untar it if interested.

## Use base box

    mkdir -p ~/Vagrant/jessie
    cd ~/Vagrant/jessie
    vagrant box add debian-8.2 ~/Vagrant/PackerBoxes/vagrant-packer-boxes/builds/virtualbox/debian-8.2-2016-01-10.box
    vagrant init debian-8.2
    vagrant up
    vagrant ssh

## Customize base box

- Edit and update '''Vagrantfile'''
- Edit and update '''debian-8.2.json'''
- Edit and update install scripts at '''scripts/'''
- Edit and update preseed config file at '''http/'''
