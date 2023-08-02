#!/bin/sh

# Installs and configures the Uncomplicated Firewall to the Adguard Server

adguard_ip="${1:-127.0.0.1}"
nextcloud_ip="${1:-127.0.0.2}"

echo "${adguard_ip}"
echo "${nextcloud_ip}"

# Adguard
ufw default deny incoming

ufw default allow outgoing

ufw allow openssh

ufw enable

ufw status numbered

ufw allow openssh

ufw allow from "${adguard_ip}" proto tcp to any port 80
ufw allow from "${adguard_ip}" proto tcp to any port 8080
ufw allow from "${adguard_ip}" proto tcp to any port 443
ufw allow from "${adguard_ip}" proto udp to any port 443

ufw allow from "${nextcloud_ip}" proto tcp to any port 80
ufw allow from "${nextcloud_ip}" proto tcp to any port 8080
ufw allow from "${nextcloud_ip}" proto tcp to any port 443
ufw allow from "${nextcloud_ip}" proto udp to any port 443

ufw status numbered

# Docker swarm ports
ufw allow from "${adguard_ip}" proto tcp to any port 2377
ufw allow from "${nextcloud_ip}" proto tcp to any port 2377

ufw allow from "${adguard_ip}" proto tcp to any port 7946
ufw allow from "${adguard_ip}" proto udp to any port 7946
ufw allow from "${nextcloud_ip}" proto tcp to any port 7946
ufw allow from "${nextcloud_ip}" proto udp to any port 7946

ufw allow from "${adguard_ip}" proto udp to any port 4789
ufw allow from "${nextcloud_ip}" proto udp to any port 4789

exit 0
