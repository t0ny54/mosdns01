FROM irinesistiana/mosdns:latest

RUN apk update && apk add curl

ADD hosts /hosts
COPY ./content /etc/mosdns
COPY hosts /hosts
ADD crontab.txt /crontab.txt
ADD script1.sh /script1.sh
ADD script2.sh /script2.sh

COPY ./content /etc/mosdns

RUN sh /script1.sh
RUN sh /script2.sh

ENV PORT=8080
ENV DOH_PATH=/dns-query

EXPOSE 8080

ENTRYPOINT [ "sh","/etc/mosdns/entrypoint.sh" ]
