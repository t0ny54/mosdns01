FROM irinesistiana/mosdns:latest

COPY ./content /etc/mosdns

ADD hosts /hosts
COPY hosts /hosts

ENV PORT=8080
ENV DOH_PATH=/dns-query

EXPOSE 8080

ENTRYPOINT [ "sh","/etc/mosdns/entrypoint.sh" ]
