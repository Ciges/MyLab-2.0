#!/bin/bash
# Script to set SSH access on VM's

users="ciges root"  # Users to configure SSH access

for u in ${users}; do
    # Add public ssh keys
    ! [[ -d "${user_dir}/.ssh" ]] && mkdir "${user_dir}/.ssh"
    if [[ -d "/tmp/ssh_keys" ]]; then
        cat /tmp/ssh_keys/* >> "${user_dir}/.ssh/authorized_keys"
        chown ${u}:${u} "${user_dir}/.ssh/authorized_keys"
    fi;
done
