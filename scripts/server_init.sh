#!/bin/bash

# Script to initialize recent installed VM's

## add ciges user
groupadd wheel
useradd -m ciges -s /bin/bash -G sudo,wheel
cp -a /home/vagrant/.ssh /home/ciges/
chown -R ciges:ciges /home/ciges
echo "ciges ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ciges

## Update and add packages
apt-get update
