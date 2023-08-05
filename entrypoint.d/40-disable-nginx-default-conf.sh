#!/bin/sh

# Container: NGINX DIR PATH
NGINX_DIR="/etc/nginx"

# NGINX SERVICE CONFIG DIR
NGINX_CONFIG_DIR="${NGINX_DIR}/conf.d"

# Default service file enabled
DEFAULT_ENABLED="${NGINX_CONFIG_DIR}/default.conf"

# Default service file disabled
DEFAULT_DISABLED="${NGINX_CONFIG_DIR}/default.off"

# Check if the default service configuration is enabled and disable it
while [ -f "${DEFAULT_ENABLED}" ]; do
    echo "The NGINX default service configuration is enabled and active!"
    sleep 1;
    mv "${DEFAULT_ENABLED}" "${DEFAULT_DISABLED}"
done

if [ -f "${DEFAULT_DISABLED}" ];
then
    echo "The NGINX default service configuration is disabled and inactive!"
fi
exit 0;