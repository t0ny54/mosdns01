FROM irinesistiana/mosdns:latest

ADD crontab.txt /crontab.txt
ADD script.sh /script.sh
ADD hosts /hosts
COPY hosts /hosts
RUN /usr/bin/crontab /crontab.txt

COPY --from=builder /root/mosdns/mosdns /usr/bin/

RUN apk add --no-cache ca-certificates \
	&& mkdir /etc/mosdns
ADD entrypoint.sh /entrypoint.sh
ADD config.yaml /config.yaml
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat /geoip.dat
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat /geosite.dat
ADD hosts /etc/mosdns/hosts
COPY hosts /etc/mosdns/hosts
VOLUME /etc/mosdns
EXPOSE 53/udp 53/tcp
RUN chmod +x /entrypoint.sh
CMD ["sh", "/entrypoint.sh"]
