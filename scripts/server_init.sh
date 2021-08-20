#!/bin/bash

# Script to initialize recent installed VM's

## add wheel group and ciges user
if ! grep -q "^wheel:" /etc/group; then
    groupadd wheel
fi;
if ! id ciges &>/dev/null; then 
    useradd -m ciges -s /bin/bash -G sudo,wheel
    chown -R ciges:ciges /home/ciges
    chmod go-rwx /home/ciges
fi;

## Update and add packages
apt-get update

## Undo permission on /tmp/etc to be able to run provision command multiple times
if [[ -d /tmp/etc ]]; then
    chown -Rh vagrant:vagrant /tmp/etc
fi;
