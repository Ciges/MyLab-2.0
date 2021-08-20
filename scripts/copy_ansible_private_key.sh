#!/bin/bash
# Set Ansible private key for root user
# ssh_keys are copied under /tmp/ssh_keys

private_key="/tmp/ssh_keys/id_rsa_ansible"

if [[ -f ${private_key} ]]; then
    if ! [[ -d "/root/.ssh" ]]; then
        mkdir "/root/.ssh"
        chown root:root "/root/.ssh"
    fi;
    echo "Adding ansible private key to root ..."
    cp ${private_key} /root/.ssh/id_rsa
    chown root:root /root/.ssh/id_rsa
    chmod u+rw,go-rwx /root/.ssh/id_rsa
fi;