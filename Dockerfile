FROM irinesistiana/mosdns:latest

ADD hosts /hosts
COPY hosts /hosts
ADD hosts /etc/mosdns/hosts
COPY hosts /etc/mosdns/hosts
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat /geoip.dat
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat /geosite.dat
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat /etc/mosdns/geoip.dat
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat /etc/mosdns/geosite.dat

COPY ./content /etc/mosdns

ENV PORT=8080
ENV DOH_PATH=/dns-query

EXPOSE 8080

ENTRYPOINT [ "sh","/etc/mosdns/entrypoint.sh" ]
