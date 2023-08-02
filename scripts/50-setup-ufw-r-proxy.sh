#!/bin/sh

# Installs and configures the Uncomplicated Firewall to the Adguard Server

adguard_ip="${1}:-127.0.0.1"
nextcloud_ip="${1}:-127.0.0.2"

# Adguard
ufw default deny incoming

ufw default allow outgoing

ufw allow openss

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

nfw status numbered

exit 0
