#!/bin/sh

# Installs and configures the Uncomplicated Firewall to the Adguard Server

r-proxy-ip="${1:-127.0.0.1}"
nextcloud-ip="${1:-127.0.0.2}"

# Adguard
ufw deny incoming

ufw allow outgoing

ufw allow openss

ufw enable

ufw status numbered

ufw allow openssh

ufw allow from "${r-proxy-ip}" proto tcp to any port 53
ufw allow from "${r-proxy-ip}" proto udp to any port 53
ufw allow from "${r-proxy-ip}" proto udp to any port 67
ufw allow from "${r-proxy-ip}" proto udp to any port 68
ufw allow from "${r-proxy-ip}" proto tcp to any port 80
ufw allow from "${r-proxy-ip}" proto tcp to any port 443
ufw allow from "${r-proxy-ip}" proto udp to any port 443
ufw allow from "${r-proxy-ip}" proto udp to any port 784
ufw allow from "${r-proxy-ip}" proto tcp to any port 853
ufw allow from "${r-proxy-ip}" proto udp to any port 853
ufw allow from "${r-proxy-ip}" proto tcp to any port 3000
ufw allow from "${r-proxy-ip}" proto udp to any port 5443
ufw allow from "${r-proxy-ip}" proto udp to any port 8853

ufw allow from "${nextcloud-ip}" proto tcp to any port 53
ufw allow from "${nextcloud-ip}" proto udp to any port 53
ufw allow from "${nextcloud-ip}" proto udp to any port 67
ufw allow from "${nextcloud-ip}" proto udp to any port 68
ufw allow from "${nextcloud-ip}" proto tcp to any port 80
ufw allow from "${nextcloud-ip}" proto tcp to any port 443
ufw allow from "${nextcloud-ip}" proto udp to any port 443
ufw allow from "${nextcloud-ip}" proto udp to any port 784
ufw allow from "${nextcloud-ip}" proto tcp to any port 853
ufw allow from "${nextcloud-ip}" proto udp to any port 853
ufw allow from "${nextcloud-ip}" proto tcp to any port 3000
ufw allow from "${nextcloud-ip}" proto udp to any port 5443
ufw allow from "${nextcloud-ip}" proto udp to any port 8853

nfw status numbered

exit 0
