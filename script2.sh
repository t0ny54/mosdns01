#!/usr/bin/env sh

HOSTS_URL="https://raw.githubusercontent.com/t0ny54/blocklistwithregex/main/export/blocklist.txt"
NEW_HOSTS="/tmp/hosts"
HOSTS_PATH="/etc/mosdns/hosts"

# Grab hosts file
wget -O $NEW_HOSTS $HOSTS_URL

cp -v $NEW_HOSTS $HOSTS_PATH
