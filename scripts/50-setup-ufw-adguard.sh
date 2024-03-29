#!/bin/sh

# Installs and configures the Uncomplicated Firewall to the Adguard Server

r_proxy_ip="${1:-127.0.0.1}"
nextcloud_ip="${1:-127.0.0.2}"

echo "${r_proxy_ip}"
echo "${nextcloud_ip}"

# Adguard
ufw default deny incoming

ufw default allow outgoing

ufw allow openssh

ufw --force enable

ufw status numbered

ufw allow openssh

ufw allow from "${r_proxy_ip}" proto tcp to any port 53
ufw allow from "${r_proxy_ip}" proto udp to any port 53
ufw allow from "${r_proxy_ip}" proto udp to any port 67
ufw allow from "${r_proxy_ip}" proto udp to any port 68
ufw allow from "${r_proxy_ip}" proto tcp to any port 80
ufw allow from "${r_proxy_ip}" proto tcp to any port 443
ufw allow from "${r_proxy_ip}" proto udp to any port 443
ufw allow from "${r_proxy_ip}" proto udp to any port 784
ufw allow from "${r_proxy_ip}" proto tcp to any port 853
ufw allow from "${r_proxy_ip}" proto udp to any port 853
ufw allow from "${r_proxy_ip}" proto tcp to any port 3000
ufw allow from "${r_proxy_ip}" proto udp to any port 5443
ufw allow from "${r_proxy_ip}" proto udp to any port 8853

ufw allow from "${nextcloud_ip}" proto tcp to any port 53
ufw allow from "${nextcloud_ip}" proto udp to any port 53
ufw allow from "${nextcloud_ip}" proto udp to any port 67
ufw allow from "${nextcloud_ip}" proto udp to any port 68
ufw allow from "${nextcloud_ip}" proto tcp to any port 80
ufw allow from "${nextcloud_ip}" proto tcp to any port 443
ufw allow from "${nextcloud_ip}" proto udp to any port 443
ufw allow from "${nextcloud_ip}" proto udp to any port 784
ufw allow from "${nextcloud_ip}" proto tcp to any port 853
ufw allow from "${nextcloud_ip}" proto udp to any port 853
ufw allow from "${nextcloud_ip}" proto tcp to any port 3000
ufw allow from "${nextcloud_ip}" proto udp to any port 5443
ufw allow from "${nextcloud_ip}" proto udp to any port 8853

# Docker swarm ports
ufw allow from "${r_proxy_ip}" proto tcp to any port 2377
ufw allow from "${nextcloud_ip}" proto tcp to any port 2377

ufw allow from "${r_proxy_ip}" proto tcp to any port 7946
ufw allow from "${r_proxy_ip}" proto udp to any port 7946
ufw allow from "${nextcloud_ip}" proto tcp to any port 7946
ufw allow from "${nextcloud_ip}" proto udp to any port 7946

ufw allow from "${r_proxy_ip}" proto udp to any port 4789
ufw allow from "${nextcloud_ip}" proto udp to any port 4789

ufw status numbered

exit 0
