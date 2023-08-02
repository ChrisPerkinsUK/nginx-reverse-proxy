#!/bin/sh

# Installs and configures the Uncomplicated Firewall to the Adguard Server

r_proxy_ip="${1}:-127.0.0.1"
adguard_ip="${2}:-127.0.0.3"

# Adguard
ufw deny incoming

ufw allow outgoing

ufw allow openss

ufw enable

ufw status numbered

ufw allow openssh

ufw allow from "${r_proxy_ip}" proto tcp to any port 80
ufw allow from "${r_proxy_ip}" proto tcp to any port 443
ufw allow from "${r_proxy_ip}" proto udp to any port 443
ufw allow from "${r_proxy_ip}" proto tcp to any port 3478
ufw allow from "${r_proxy_ip}" proto udp to any port 3478
ufw allow from "${r_proxy_ip}" proto tcp to any port 8080
ufw allow from "${r_proxy_ip}" proto tcp to any port 8443

ufw allow from "${adguard_ip}" proto tcp to any port 80
ufw allow from "${adguard_ip}" proto tcp to any port 443
ufw allow from "${adguard_ip}" proto udp to any port 443
ufw allow from "${adguard_ip}" proto tcp to any port 3478
ufw allow from "${adguard_ip}" proto udp to any port 3478
ufw allow from "${adguard_ip}" proto tcp to any port 8080
ufw allow from "${adguard_ip}" proto tcp to any port 8443

nfw status numbered

exit 0
