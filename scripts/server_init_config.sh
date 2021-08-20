#!/bin/bash

# Script to put config files in /etc directory inside VM's
if [[ -d "/tmp/etc" ]]; then
    chown -Rh root:root /tmp/etc
    cp -av /tmp/etc/* /etc/
fi;
