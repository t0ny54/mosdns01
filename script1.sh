#!/bin/sh

# This shell script to install the latest release of geoip.dat and geosite.dat:

# The URL of the script project is:
# https://github.com/v2fly/fhs-install-v2ray

# Modified by wy580477 for customized container <https://github.com/wy580477>

# You can set this variable whatever you want in shell session right before running this script by issuing:
# export DAT_PATH='/usr/local/lib/v2ray'

#!/usr/bin/env sh

GEOIP_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
NEW_GEOIP="./geoip.dat"
GEOIP_PATH="/etc/mosdns/geoip.dat"

# Grab hosts file
wget -O $NEW_GEOIP $GEOIP_URL

cp -v $NEW_GEOIP $GEOIP_PATH

GEOSITE_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"
NEW_GEOSITE="./geosite.dat"
GEOSITE_PATH="/etc/mosdns/geosite.dat"

# Grab hosts file
wget -O $NEW_GEOSITE $GEOSITE_URL

cp -v $NEW_GEOSITE $GEOSITE_PATH
