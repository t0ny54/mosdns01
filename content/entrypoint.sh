#!/bin/sh

sh /etc/mosdns/install_geodata.sh

/usr/sbin/crond -f -l 8

sed -i "s|PORT_PLACEHOLDER|${PORT}|;s|PATH_PLACEHOLDER|${DOH_PATH}|" /etc/mosdns/config.yaml

exec mosdns start -d /etc/mosdns
