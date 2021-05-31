#!/bin/bash
# Script to set SSH access on VM's

users="ciges root"  # Users to configure SSH access

for u in ${users}; do
    user_dir="$(getent passwd ${u}|cut -f6 -d':')"
    # Add public ssh keys
    ! [[ -d "${user_dir}/.ssh" ]] && mkdir "${user_dir}/.ssh"
    if [[ -d "/tmp/ssh_keys" ]]; then
        for kf in /tmp/ssh_keys/*; do
            # Only add key if it's not already added
            k="$(cat ${kf}|cut -f2 -d' ')"
            if ! grep -q "${k}" "${user_dir}/.ssh/authorized_keys"; then
                echo "Adding public key to user ${u} ..."
                cat ${kf} >> "${user_dir}/.ssh/authorized_keys"
            fi;
        done;
    fi;
done
