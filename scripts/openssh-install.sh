#!/bin/bash

## Install and set-up Openssh-server on an ubuntu machine

# Update the apt repositories

apt update

# Install openssh-server
apt install -y openssh-server

# Allow password Authentication
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# restart the ssh daemon
/etc/init.d/ssh restart