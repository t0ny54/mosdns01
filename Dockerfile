FROM irinesistiana/mosdns:latest

ADD crontab.txt /crontab.txt
ADD script.sh /script.sh
ADD hosts /hosts
COPY hosts /hosts
RUN /usr/bin/crontab /crontab.txt

COPY ./content /etc/mosdns

RUN sh /etc/mosdns/install_geodata.sh

ENV PORT=8080
ENV DOH_PATH=/dns-query

EXPOSE 8080

ENTRYPOINT [ "sh","/etc/mosdns/entrypoint.sh" ]
