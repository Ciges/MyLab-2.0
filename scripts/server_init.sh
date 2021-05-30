#!/bin/bash

# Script to initialize recent installed VM's

## add ciges user
groupadd wheel
useradd -m ciges -s /bin/bash -G sudo,wheel
cp -a /home/vagrant/.ssh /home/ciges/
chown -R ciges:ciges /home/ciges
chmod go-rwx /home/ciges

## Update and add packages
apt-get update

## Undo permission on /tmp/etc to be able to run provision command multiple times
if [[ -d /tmp/etc ]]; then
    chown -Rh vagrant:vagrant /tmp/etc
fi;
