FROM irinesistiana/mosdns:latest

ADD hosts /hosts
COPY ./content /etc/mosdns
COPY hosts /hosts

RUN sh /etc/mosdns/install_geodata.sh

ENV PORT=8080
ENV DOH_PATH=/dns-query

EXPOSE 8080

ENTRYPOINT [ "sh","/etc/mosdns/entrypoint.sh" ]
